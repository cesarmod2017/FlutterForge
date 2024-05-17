import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      //print(true);
      return newValue;
    }
    String newText = newValue.text.replaceAll("R\$", '').replaceAll(',', '.');

    final double value = double.parse(newText);

    final formatter = NumberFormat.simpleCurrency(locale: "pt_Br");

    newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
