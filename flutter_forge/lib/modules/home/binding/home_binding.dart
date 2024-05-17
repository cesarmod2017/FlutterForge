import 'package:flutter_forge/exports/get_exports.dart';
import 'package:flutter_forge/modules/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}
