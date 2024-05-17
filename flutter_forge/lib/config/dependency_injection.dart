import 'package:flutter_forge/app/controller/permission_controller.dart';
import 'package:flutter_forge/app/controller/theme_controller.dart';
import 'package:flutter_forge/config/databases/ILocalDb.dart';
import 'package:flutter_forge/config/databases/database_init.dart';
import 'package:get/get.dart';

abstract class DependencyInjection {
  static Future<void> init() async {
    // Get.put<ConnectivityController>(ConnectivityController());
    // Get.put<AppConfigurationController>(AppConfigurationController());
    Get.put<ILocalDb>(LocalDb());
    //Register Controllers
    // Get.put<AppController>(AppController());
    Get.put<PermissionController>(PermissionController());

    Get.put<ThemesController>(ThemesController());
    // Get.put<NavigationPageController>(NavigationPageController());

    //Register Apis
    // Get.put<IRoutesApi>(RoutesApi(Get.find()));
  }
}
