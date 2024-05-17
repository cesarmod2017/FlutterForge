import 'dart:async';

import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/exports/get_exports.dart';

class Loading {
  static Timer? _timer;
  static bool isShowing = false;
  static String? titleMessage;
  static void hide() {
    if (isShowing == false) return;
    isShowing = false;
    _timer?.cancel();
    Get.back();
  }

  static void show({String? title}) {
    titleMessage = title;
    isShowing = true;
    _timer = Timer(const Duration(seconds: 60), () {
      if (isShowing) {
        hide();
        Dialogs.confirm(
          'attention'.tr,
          "delayedProcess".tr,
          buttonNameCancel: "cancel".tr,
          onPressedCancel: () {
            Get.back();
            isShowing = true;
            hide();
          },
          buttonNameOk: "yes".tr,
          onPressedOk: () {
            Get.back();
            show(title: titleMessage);
          },
        );
      }
    });
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.7)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      if (title != null) const SizedBox(height: 10),
                      if (title != null)
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
