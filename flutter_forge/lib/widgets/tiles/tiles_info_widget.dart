import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/widgets/label/label_ritch_widget.dart';

class TilesInfoWidget extends StatelessWidget {
  const TilesInfoWidget({
    super.key,
    required this.title,
    required this.value,
    this.isRitchText,
    this.titleFontSize,
    this.valueFontSize,
    this.hasDivider,
    this.valueFontWeight,
    this.crossAxisAlignment,
  });
  final String title;
  final String value;
  final bool? isRitchText;
  final double? titleFontSize;
  final double? valueFontSize;
  final bool? hasDivider;
  final FontWeight? valueFontWeight;
  final CrossAxisAlignment? crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LabelWidget(
            title: title,
            fontWeight: FontWeight.normal,
            textColor: Colors.grey,
            fontSize: titleFontSize ?? 12,
          ),
          if (isRitchText != true)
            LabelWidget(
              title: value,
              fontSize: valueFontSize ?? 16,
              fontWeight: valueFontWeight,
            ),
          if (isRitchText == true)
            LabelRitchTextWidget(
              title: value,
              fontSize: valueFontSize ?? 16,
              fontWeight: valueFontWeight,
            ),
          Visibility(
            visible: hasDivider == null || hasDivider == true,
            child: Divider(
              color: Colors.grey.shade300,
            ),
          )
        ],
      ),
    );
  }
}
