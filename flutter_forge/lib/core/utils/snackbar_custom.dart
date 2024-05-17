import 'package:flutter/material.dart';
import 'package:flutter_forge/exports/get_exports.dart';

abstract class NotifyCustom {
  static void error(String error) {
    Get.snackbar(
      'attention'.tr,
      error,
      isDismissible: false,
      duration: const Duration(seconds: 10),
      mainButton: TextButton(
        child: const Icon(
          Icons.close,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  static void exception(Object e) {
    Get.snackbar(
      'attention'.tr,
      e.toString(),
      isDismissible: false,
      duration: const Duration(seconds: 10),
      mainButton: TextButton(
        child: const Icon(
          Icons.close,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  static void sucess(String title, String message, {int? secondsDuration}) {
    Get.snackbar(
      title,
      message,
      isDismissible: false,
      duration: Duration(seconds: secondsDuration ?? 5),
      mainButton: TextButton(
        child: const Icon(
          Icons.close,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  static void warning(String message, {int? secondsDuration}) {
    Get.snackbar(
      'attention'.tr,
      message,
      isDismissible: false,
      duration: Duration(seconds: secondsDuration ?? 5),
      mainButton: TextButton(
        child: const Icon(
          Icons.close,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
