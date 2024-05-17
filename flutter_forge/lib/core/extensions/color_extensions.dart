import 'package:flutter_forge/exports/basic_exports.dart';

extension ColorExtensions on String {
  Color toColor() {
    return Color(int.parse(replaceAll('#', '0xff')));
  }
}
