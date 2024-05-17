import 'package:flutter_forge/exports/get_exports.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 500), () {
      initialize();
    });
  }

  Future<void> initialize() async {
    Get.offAllNamed(RoutesPath.home);
  }
}
