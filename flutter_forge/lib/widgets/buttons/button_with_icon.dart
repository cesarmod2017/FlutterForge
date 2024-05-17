import 'package:flutter_forge/exports/basic_exports.dart';

class ButtonWithIcon extends StatelessWidget {
  // ignore: use_super_parameters
  const ButtonWithIcon(
      {super.key,
      required this.title,
      this.fontSize,
      this.textColor,
      this.onPressed,
      this.buttonColor,
      this.icon});
  final String title;
  final double? fontSize;
  final Color? textColor;
  final Color? buttonColor;
  final GestureTapCallback? onPressed;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: buttonColor,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelWidget(
              title: title,
              textColor: textColor ?? Colors.white,
              fontSize: fontSize ?? 14,
              fontWeight: FontWeight.bold,
            ),
            if (icon != null) 5.toWidthSpace(),
            if (icon != null) icon!
          ],
        ),
      ),
    );
  }
}
