class StringUltis {
  static String  toCamelKey(String keyPath) {
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
 static  Map<String, String> flattenJson(
    Map<String, dynamic> json, [
    String prefix = '',
  ]) {
    final Map<String, String> result = {};

    json.forEach((key, value) {
      final newKey = toCamelKey(prefix.isEmpty ? key : '$prefix.$key');

      if (value is String) {
        result[newKey] = value;
      } else if (value is Map<String, dynamic>) {
        result.addAll(
          flattenJson(value, prefix.isEmpty ? key : '$prefix.$key'),
        );
      }
    });
    return result;
  }
 static String replaceBodyIncludingBraces(String input, String newBodyWithBraces) {
  final pattern = RegExp(r'\{[\s\S]*?\}');
  if (!pattern.hasMatch(input)) {
    return input;
  }
  return input.replaceFirstMapped(pattern, (match) => '\$$newBodyWithBraces');
}
 static String? findValue(String input){
    final pattern = RegExp(r'\{([\s\S]*?)\}');
    final match=pattern.firstMatch(input);
    if(match !=null&& match.groupCount>=1) {
      return match.group(1);
    }
    return null;
  }
}