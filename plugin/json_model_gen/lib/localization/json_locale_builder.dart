import 'dart:convert';
import 'package:build/build.dart';
import 'package:json_model_gen/component/string_ultis.dart';
import 'package:path/path.dart' as p;

class JsonLocaleBuilder implements Builder {
  @override
  final buildExtensions = const {
    '^assets/lang/{{}}.json': ['lib/generated/localization/{{}}.locale.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    final contents = await buildStep.readAsString(inputId);
    final jsonMap = json.decode(contents) as Map<String, dynamic>;

    final flat = _flattenJson(jsonMap);

    final buffer = StringBuffer();
    final locale = p.basenameWithoutExtension(inputId.path);

    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln('import \'s.locale.dart\';');
    buffer.writeln('');
    buffer.writeln(
      'class S${locale.substring(0, 1).toUpperCase()}${locale.substring(1)} implements S {',
    );

    for (final entry in flat.entries) {
      final key = entry.key;
      String value = entry.value.replaceAll(r'$', r'\$');

      String param = StringUltis.findValue(value) ?? '';

      buffer.writeln('  @override');
      if(param.isNotEmpty){
        param = StringUltis.toCamelKey(param);
        value = StringUltis.replaceBodyIncludingBraces(value, param);
        buffer.writeln('  String $key(String $param) => "$value";');
      }else{buffer.writeln('  String get $key => "$value";');}
      

      
    }

    buffer.writeln('}');

    final outputId = AssetId(
      inputId.package,
      'lib/generated/localization/$locale.locale.dart',
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
        result.addAll(
          _flattenJson(value, prefix.isEmpty ? key : '$prefix.$key'),
        );
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
