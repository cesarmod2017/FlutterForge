import 'package:flutter_forge/exports/basic_exports.dart';

class CheckboxItem {
  final String label;
  final int type;
  bool value;
  final ValueChanged<bool?> onChanged;
  final double? labelSize;
  CheckboxItem(
      {required this.label,
      required this.type,
      this.value = false,
      this.labelSize,
      required this.onChanged});
}
