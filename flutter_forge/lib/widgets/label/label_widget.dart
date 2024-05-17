import 'package:flutter_forge/exports/basic_exports.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    super.key,
    required this.title,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.padding,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.fontFamily,
  });
  final String title;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        title,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
          color: textColor,
          fontFamily: fontFamily ?? 'PlusJakartaSans',
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize,
          overflow: overflow,
        ),
      ),
    );
  }
}
