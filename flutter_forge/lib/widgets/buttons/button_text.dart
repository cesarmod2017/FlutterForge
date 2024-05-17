import 'package:flutter_forge/exports/basic_exports.dart';

class ButtonText extends StatelessWidget {
  // ignore: use_super_parameters
  const ButtonText(
      {super.key,
      required this.title,
      this.fontSize,
      this.textColor,
      required this.onPressed});
  final String title;
  final double? fontSize;
  final Color? textColor;
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: LabelWidget(
        title: title,
        textColor: textColor ?? Colors.white,
        fontSize: fontSize ?? 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
