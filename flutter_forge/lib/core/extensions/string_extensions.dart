import 'package:flutter_forge/exports/get_exports.dart';
import 'package:intl/intl.dart';

extension StringExtensions on String {
  double toDoubleByStr() {
    return double.parse(replaceAll(',', '.'));
  }

  String toStringDoubleFormat() {
    return replaceAll(',', '.');
  }

  String getLasFourDigits() {
    final number = replaceAll(' ', '');
    if (number.length == 16) {
      return number.substring(12, 16);
    }

    if (number.length == 15) {
      return number.substring(11, 15);
    }

    return number.substring(12, 16);
  }

  String formatDate() {
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(this));
  }

  String formatReal() {
    return NumberFormat.currency(locale: 'pt_BR', symbol: "R\$")
        .format(DateTime.parse(this));
  }

  String onlyNumberStr() {
    return replaceAll(RegExp('[^0-9]'), '');
  }

  String gnBrandName() {
    switch (toLowerCase()) {
      case "master":
        return "mastercard";
      case "visa":
        return "visa";
      case "amex":
        return "amex";
      case "diners":
        return "diners";
      case "hipercard":
        return "hipercard";
      case "elo":
        return "elo";
      default:
        return "";
    }
  }

  String gnMonth() {
    return split("/")[0];
  }

  String gnYear() {
    return "20${split("/")[1]}";
  }

  String removeCpfMask() {
    if (isCpf) {
      String cpfDotOff = replaceAll('.', '');
      String cpfReturn = cpfDotOff.replaceFirst('-', '');
      return cpfReturn;
    } else if (isCnpj) {
      String cpfDotOff = replaceAll('.', '');
      String cpfLineOff = cpfDotOff.replaceFirst('-', '');
      String cpfBarOff = cpfLineOff.replaceFirst('/', '');
      return cpfBarOff;
    } else {
      return '';
    }
  }

  String formatDateIso() {
    final dateFormart = DateFormat('dd/MM/yyyy');
    var outputFormat = DateFormat('yyyy-MM-dd');

    final dateParsed = dateFormart.parse(this);
    var outputDate = outputFormat.format(dateParsed);

    return '${outputDate}T00:00:00.000Z';
  }

  String formatDateFromIso() {
    final dateWithoutIso = split('T');
    final outputFormat = DateFormat('dd/MM/yyyy');
    var dateFormart = DateFormat('yyyy-MM-dd');
    final dateParsed = dateFormart.parse(dateWithoutIso[0]);
    var outputDate = outputFormat.format(dateParsed);
    return outputDate;
  }

  String formatDateFromIsoShort() {
    final dateWithoutIso = split('T');
    final outputFormat = DateFormat('dd/MM');
    var dateFormart = DateFormat('yyyy-MM-dd');
    final dateParsed = dateFormart.parse(dateWithoutIso[0]);
    var outputDate = outputFormat.format(dateParsed);
    return outputDate;
  }

  String genderFormart() {
    if (toLowerCase() == 'masculino') {
      return "M";
    } else if (toLowerCase() == 'feminino') {
      return "F";
    } else {
      return this;
    }
  }

  int compareDate() {
    final expireTokenDate = DateTime.parse(this);
    final dateNow = DateTime.now();
    final isPass = dateNow.compareTo(expireTokenDate);
    return isPass;
  }

  int convertVersionStringToInt() {
    var parts = split('.');
    var major = int.parse(parts[0]);
    var minor = int.parse(parts[1]);
    var patch = int.parse(parts[2]);

    return major * 10000 + minor * 100 + patch; // Exemplo: 2.0.7 se torna 20007
  }

  double toDouble() {
    var value = this;
    if (value.contains(",") && value.contains(".")) {
      value = value.replaceAll(".", "");
      value = value.replaceAll(",", ".");
    } else if (value.contains(",") && !value.contains(".")) {
      value = value.replaceAll(",", ".");
    }
    return double.parse(value);
  }

  DateTime? formatDateByGmt() {
    DateTime? parsedDate;
    String inputDate = this;
    try {
      return DateTime.parse(inputDate);
    } catch (e) {
      // Use uma expressão regular para extrair partes da data
      RegExp regExp =
          RegExp(r'(\d{2}) (\w{3}) (\d{4}) (\d{2}):(\d{2}):(\d{2}) GMT');
      Match? match = regExp.firstMatch(inputDate);
      if (match != null) {
        String day = match[1]!;
        String monthString = match[2]!;
        String year = match[3]!;
        String hour = match[4]!;
        String minute = match[5]!;
        String second = match[6]!;

        // Mapeie o nome do mês para o número do mês
        Map<String, int> monthMap = {
          'Jan': 1,
          'Feb': 2,
          'Mar': 3,
          'Apr': 4,
          'May': 5,
          'Jun': 6,
          'Jul': 7,
          'Aug': 8,
          'Sep': 9,
          'Oct': 10,
          'Nov': 11,
          'Dec': 12,
        };

        int month = monthMap[monthString]!;
        parsedDate = DateTime(
          int.parse(year),
          month,
          int.parse(day),
          int.parse(hour),
          int.parse(minute),
          int.parse(second),
        );
      }
      return parsedDate;
    }
  }
}
