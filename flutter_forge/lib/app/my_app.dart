import 'package:flutter_forge/app/controller/theme_controller.dart';
import 'package:flutter_forge/app/locales/app_locales.dart';
import 'package:flutter_forge/app/routes/app_routes.dart';
import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/exports/get_exports.dart';
import 'package:flutter_forge/modules/splashscreen/binding/splash_binding.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

class MyAppMain extends StatelessWidget {
  const MyAppMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemesController>(builder: (controller) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LingoChat',
        theme: controller.theme,
        getPages: AppPages.pages,
        initialRoute: RoutesPath.splashPage,
        initialBinding: SplashBinding(),
        locale: const Locale('pt', 'BR'),
        fallbackLocale: const Locale('pt', 'BR'),
        supportedLocales: const [
          Locale('en', ''), // English
          Locale('pt', 'BR'), // Portuguese
          // add more locales as needed
        ],
        translations: AppTranslations(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      );
    });
  }
}
