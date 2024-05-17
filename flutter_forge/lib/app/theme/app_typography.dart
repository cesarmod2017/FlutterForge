import 'package:flutter_forge/app/utils/responsive_widget.dart';
import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/exports/get_exports.dart';

double displayExtraLarge = 38;
double displarLarge = 26;
double displayMedium = 23;
double heading = 20;
double title = 18;
double subHeading = 15;
double body = 15;
double caption = 13;
double tiny = 11;
double buttonLarge = 15;
double buttonSmall = 13;

const FontWeight bold = FontWeight.w700;
const FontWeight medium = FontWeight.w500;
const FontWeight regular = FontWeight.w300;

abstract class TxtStyles {
  static _textColor() {
    return Get.isDarkMode ? null : textColor;
  }

  static dpLarge() {
    return Responsive.sizes(mobile: 38, tablet: 32, desktop: 38);
  }

  static dpMedium() {
    return Responsive.sizes(mobile: 26, tablet: 22, desktop: 26);
  }

  static dpSmall() {
    return Responsive.sizes(mobile: 23, tablet: 19, desktop: 23);
  }

  static hdMedium() {
    return Responsive.sizes(mobile: 20, tablet: 18, desktop: 20);
  }

  static hdSmall() {
    return Responsive.sizes(mobile: 15, tablet: 13, desktop: 15);
  }

  static titleLg() {
    return Responsive.sizes(mobile: 18, tablet: 15, desktop: 18);
  }

  static titleMd() {
    return Responsive.sizes(mobile: 17, tablet: 14, desktop: 17);
  }

  static titleSm() {
    return Responsive.sizes(mobile: 15, tablet: 12, desktop: 15);
  }

  static bodyLg() {
    return Responsive.sizes(mobile: 15, tablet: 13, desktop: 15);
  }

  static bodyMd() {
    return Responsive.sizes(mobile: 13, tablet: 10, desktop: 13);
  }

  static bodySm() {
    return Responsive.sizes(mobile: 11, tablet: 9, desktop: 11);
  }

  static TextStyle displayLarge(BuildContext context) => Theme.of(context)
      .textTheme
      .displayLarge!
      .copyWith(fontSize: dpLarge(), color: _textColor());
  static TextStyle displayMedium(BuildContext context) => Theme.of(context)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: dpMedium(), color: _textColor());
  static TextStyle displaySmall(BuildContext context) => Theme.of(context)
      .textTheme
      .displaySmall!
      .copyWith(fontSize: dpSmall(), color: _textColor());
  static TextStyle headlineMedium(BuildContext context) => Theme.of(context)
      .textTheme
      .headlineMedium!
      .copyWith(fontSize: hdMedium(), color: _textColor());
  static TextStyle headlineSmall(BuildContext context) => Theme.of(context)
      .textTheme
      .headlineSmall!
      .copyWith(fontSize: hdSmall(), color: _textColor());
  static TextStyle titleLarge(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: titleLg());
  static TextStyle titleMedium(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: titleMd());
  static TextStyle titleSmall(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: titleSm());
  static TextStyle bodyLarge(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: bodyLg());
  static TextStyle bodyMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: bodyMd());
  static TextStyle bodySmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: bodySm());
}
