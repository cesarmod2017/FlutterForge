import 'package:flutter_forge/exports/basic_exports.dart';

class LabelValueVerticalWidget extends StatelessWidget {
  const LabelValueVerticalWidget({
    super.key,
    required this.title,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.padding,
    this.overflow,
    this.maxLines,
    this.textAlign,
    required this.value,
    this.crossAxisAlignment,
    this.fontSizeTitle,
  });
  final String title;
  final String value;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? fontSizeTitle;
  final EdgeInsetsGeometry? padding;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final CrossAxisAlignment? crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: Text(
            title,
            maxLines: maxLines,
            textAlign: textAlign,
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight ?? FontWeight.bold,
              fontSize: fontSizeTitle ?? 14,
              overflow: overflow,
            ),
          ),
        ),
        Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: Text(
            value,
            maxLines: maxLines,
            textAlign: textAlign,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.normal,
              fontSize: fontSize ?? 14,
              overflow: overflow,
            ),
          ),
        ),
      ],
    );
  }
}
