import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

extension NumberTextInputFormatter on TextInputFormatter {
  static TextInputFormatter withSeparator() {
    return _NumberTextInputFormatter();
  }
}

class _NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    final newText = NumberFormat.decimalPattern()
        .format(int.tryParse(text.replaceAll(',', '')) ?? 0);
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
