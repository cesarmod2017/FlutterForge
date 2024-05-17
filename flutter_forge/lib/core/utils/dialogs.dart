import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/exports/get_exports.dart';

class Dialogs {
  static Future<void> info(String title, String message,
      {String? buttonName, VoidCallback? buttonOnPressed}) async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible:
          false, // impede o usuário de fechar o diálogo ao tocar fora dele
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: buttonOnPressed ??
                  () {
                    Get.back();
                  },
              child: Text(buttonName ?? 'OK'),
            ),
          ],
        );
      },
    );
  }

  static Future<void> confirm(String title, String message,
      {String? buttonNameOk,
      String? buttonNameCancel,
      VoidCallback? onPressedOk,
      VoidCallback? onPressedCancel}) async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: onPressedCancel ??
                  () {
                    Get.back();
                  },
              child: Text(buttonNameCancel ?? 'Não Obrigado'.toUpperCase()),
            ),
            TextButton(
              onPressed: onPressedOk ??
                  () {
                    Get.back();
                  },
              child: Text(buttonNameOk ?? 'Sim'.toUpperCase()),
            ),
          ],
        );
      },
    );
  }
}
