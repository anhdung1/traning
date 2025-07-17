import 'dart:convert';
import 'package:build/build.dart';
import 'package:json_model_gen/component/string_ultis.dart';

class InterfaceBuilder implements Builder {
  @override
  final buildExtensions = const {
    '^assets/lang/vi.json': ['lib/generated/localization/s.locale.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    final contents = await buildStep.readAsString(inputId);
    final jsonMap = json.decode(contents) as Map<String, dynamic>;

    final flat = StringUltis.flattenJson(jsonMap);

    final buffer = StringBuffer();
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln(
      'abstract class S {',
    );

    for (final entry in flat.entries) {
      final key = entry.key;
      final value = entry.value;
      String param = StringUltis.findValue(value) ?? '';
      if(param.isNotEmpty){
        param = StringUltis.toCamelKey(param);
        buffer.writeln('  String $key(String $param);');
      }
      else{
        buffer.writeln('  String get $key;');
      }
    }

    buffer.writeln('}');

    final outputId = AssetId(
      inputId.package,
      'lib/generated/localization/s.locale.dart',
    );
    await buildStep.writeAsString(outputId, buffer.toString());
  }
}
