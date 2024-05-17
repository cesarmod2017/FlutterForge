import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:get/get.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? smallMobile;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    this.smallMobile,
  });

  static bool isSmallMobile() => MediaQuery.of(Get.context!).size.width < 320;

  static bool isMobile() => MediaQuery.of(Get.context!).size.width < 400;

  static bool isTablet() =>
      MediaQuery.of(Get.context!).size.width < 1080 &&
      MediaQuery.of(Get.context!).size.width >= 650;

  static bool isDesktop() => MediaQuery.of(Get.context!).size.width >= 1080;

  @override
  Widget build(BuildContext context) {
    if (isDesktop()) {
      return desktop;
    } else if (isTablet() && tablet != null) {
      return tablet!;
    } else if (isSmallMobile() && smallMobile != null) {
      return smallMobile!;
    } else {
      return mobile;
    }
  }

  static double doubleSizes(
      {double? small,
      required double mobile,
      required double tablet,
      required double desktop}) {
    if (isSmallMobile()) return small ?? mobile;
    if (isMobile()) return mobile;
    if (isTablet()) return tablet;
    if (isDesktop()) return desktop;
    return mobile;
  }

  static dynamic sizes({
    dynamic small,
    dynamic mobile,
    required dynamic tablet,
    required dynamic desktop,
  }) {
    if (isSmallMobile()) return small ?? mobile;
    if (isMobile()) return mobile;
    if (isTablet()) return tablet;
    if (isDesktop()) return desktop;
    return mobile;
  }

  static double maxWidth() {
    return 700;
  }
}
