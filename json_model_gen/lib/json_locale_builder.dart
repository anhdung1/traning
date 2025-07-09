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

    final contents = await buildStep.readAsString(inputId);
    final jsonMap = json.decode(contents) as Map<String, dynamic>;

    final flat = _flattenJson(jsonMap);

    final buffer = StringBuffer();
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln('class S {');

    for (final entry in flat.entries) {
      final key = entry.key;
      final value = entry.value.replaceAll(r'$', r'\$');
      buffer.writeln('  static const String $key = "$value";');
    }

    buffer.writeln('}');
    final locale = p.basenameWithoutExtension(inputId.path);
    final outputId = AssetId(
      inputId.package,
      'lib/generated/$locale.locale.dart',
    );
    await buildStep.writeAsString(outputId, buffer.toString());
  }

  Map<String, String> _flattenJson(
    Map<String, dynamic> json, [
    String prefix = '',
  ]) {
    final Map<String, String> result = {};

    json.forEach((key, value) {
      final newKey = _toCamelKey(prefix.isEmpty ? key : '$prefix.$key');

      if (value is String) {
        result[newKey] = value;
      } else if (value is Map<String, dynamic>) {
        result.addAll(_flattenJson(value, prefix.isEmpty ? key : '$prefix.$key'));
      }
    });

    return result;
  }

  String _toCamelKey(String keyPath) {
  final parts = keyPath.split('.');

  String result = '';
  for (int i = 0; i < parts.length; i++) {
    final segmentParts = parts[i].split('_');
    for (int j = 0; j < segmentParts.length; j++) {
      final part = segmentParts[j];
      if (i == 0 && j == 0) {
        result += part;
      } else {
        result += part[0].toUpperCase() + part.substring(1);
      }
    }
  }
  return result;
}
}
