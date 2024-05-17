import 'package:flutter_forge/exports/get_exports.dart';
import 'package:flutter_forge/modules/splashscreen/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(), permanent: true);
  }
}
