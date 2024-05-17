import 'package:flutter_forge/exports/basic_exports.dart';

class LabelRitchTextWidget extends StatelessWidget {
  const LabelRitchTextWidget(
      {super.key,
      required this.title,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.textDecoration});

  final String title;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: title,
            style: TextStyle(
              decoration: textDecoration ?? TextDecoration.none,
              decorationThickness: 1.0,
              decorationColor: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
