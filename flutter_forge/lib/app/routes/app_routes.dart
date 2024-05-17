import 'package:flutter_forge/modules/app_modules.dart';
import 'package:flutter_forge/modules/splashscreen/pages/splash_page.dart';

import '../../exports/get_exports.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
        name: RoutesPath.home,
        bindings: [HomeBinding()],
        page: () => const HomePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: RoutesPath.splashPage,
        bindings: const [],
        page: () => const SplashScreenPage(),
        transition: Transition.fadeIn),
  ];
}
