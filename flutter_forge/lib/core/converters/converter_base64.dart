import 'dart:convert';
import 'dart:io';

class ConverterBase64 {
  static Future<String> getImageBase64(String path) async {
    try {
      final bytes = await File(path).readAsBytes();
      return base64Encode(bytes);
    } catch (e) {
      return "";
    }
  }

  static String getExtensions(String path) {
    return path.split('.').last;
  }
}
