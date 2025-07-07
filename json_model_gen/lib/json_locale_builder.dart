import 'dart:convert';
import 'package:build/build.dart';
import 'package:path/path.dart' as p;

class JsonLocaleBuilder implements Builder {
  @override
  final buildExtensions = const {
    '^assets/lang/{{}}.json': ['lib/generated/{{}}.locale.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    // Ensure only process files in assets/lang/
    if (!inputId.path.startsWith('assets/lang/')) return;

    final locale = p.basenameWithoutExtension(inputId.path);
    final content = await buildStep.readAsString(inputId);
    final Map<String, dynamic> json = jsonDecode(content);

    final className = 'LocaleStrings${_capitalize(locale)}';

    final buffer = StringBuffer();
    final generatedClasses = <String, StringBuffer>{};

    _generateClass(buffer, className, json, generatedClasses);

    for (var entry in generatedClasses.entries) {
      buffer.writeln();
      buffer.writeln(entry.value.toString());
    }

    final outputId = AssetId(
      inputId.package,
      'lib/generated/$locale.locale.dart',
    );

    await buildStep.writeAsString(outputId, buffer.toString());
  }

  void _generateClass(
    StringBuffer out,
    String className,
    Map<String, dynamic> json,
    Map<String, StringBuffer> others,
  ) {
    className = snakeToCamel(className);
    out.writeln('class $className {');

    for (var entry in json.entries) {
      String key = snakeToCamel(entry.key);
      final value = entry.value;

      if (value is Map<String, dynamic>) {
        final nestedClass = snakeToCamel(_capitalize(key));
        out.writeln('  $nestedClass get $key => $nestedClass();');

        final nestedBuffer = StringBuffer();
        _generateClass(nestedBuffer, nestedClass, value, others);
        others[nestedClass] = nestedBuffer;
      } else {
        out.writeln('  String get $key => ${jsonEncode(value)};');
      }
    }

    out.writeln('}');
  }

  String snakeToCamel(String input) {
    final parts = input.split('_');
    if (parts.isEmpty) return input;
    return parts.first +
        parts
            .skip(1)
            .map((word) => word[0].toUpperCase() + word.substring(1))
            .join();
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
