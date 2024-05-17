import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String formatDateSystem() {
    var locale = Intl.systemLocale;
    return DateFormat('dd/MM/yyyy', locale).format(this);
  }

  String formatDateToApi() {
    var locale = Intl.systemLocale;
    return DateFormat('yyyy-MM-dd', locale).format(this);
  }

  String formatDateMDY() {
    var locale = Intl.systemLocale;
    return DateFormat('MM/dd/yyyy', locale).format(this);
  }

  String formatDate() {
    var locale = Intl.systemLocale;
    return DateFormat('dd/MM/yyyy', locale).format(this);
  }

  String formatDateTime() {
    var locale = Intl.systemLocale;
    return DateFormat('dd/MM/yyyy HH:mm:ss', locale).format(this);
  }

  String formatTime() {
    var locale = Intl.systemLocale;
    return DateFormat('HH:mm:ss', locale).format(this);
  }

  String chatTime() {
    var locale = Intl.systemLocale;
    return DateFormat('HH:mm', locale).format(this);
  }

  String chatTimeSync() {
    var locale = Intl.systemLocale;
    var now = DateTime.now();

    // Se a data for hoje
    if (day == now.day && month == now.month && year == now.year) {
      return DateFormat('HH:mm', locale).format(this);
    }
    // Se a data for ontem
    else if (day == now.day - 1 && month == now.month && year == now.year) {
      return 'yesterday'.tr;
    }
    // Se a data for qualquer outro dia
    else {
      return DateFormat('dd/MM/yyyy', locale).format(this);
    }
  }
}
