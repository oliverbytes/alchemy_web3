import 'dart:convert';
import 'dart:io';

abstract class TestAssetsUtils {
  static Map<String, dynamic> jsonFromFile(String path) {
    final file = File(path).readAsStringSync();
    var json = jsonDecode(file) as Map<dynamic, dynamic>;
    return json.map((key, value) => MapEntry(key, value));
  }
}
