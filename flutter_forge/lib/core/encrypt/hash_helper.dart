import 'dart:convert';

import 'package:crypto/crypto.dart';

class HashCreator {
  static String generateHash(String jsonObject) {
    final bytes = utf8.encode(jsonEncode(jsonObject));
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
