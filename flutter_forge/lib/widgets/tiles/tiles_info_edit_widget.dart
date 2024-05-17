import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/widgets/textbox/custom_textfield_nolabel_widget.dart';

class TilesInfoEditWidget extends StatelessWidget {
  const TilesInfoEditWidget({
    super.key,
    required this.title,
    required this.value,
    this.titleFontSize,
    this.hasDivider,
    required this.valueController,
    this.onChanged,
    this.onSubmitted,
    this.enabled,
    this.focusNode,
  });
  final String title;
  final String value;
  final double? titleFontSize;
  final bool? hasDivider;
  final TextEditingController valueController;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool? enabled;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LabelWidget(
          title: title,
          fontWeight: FontWeight.normal,
          textColor: Colors.grey,
          fontSize: titleFontSize ?? 12,
        ),
        CustomTextNoLabelField(
          hint: "0",
          focusNode: focusNode,
          controller: valueController,
          enabled: enabled,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          textInputType: TextInputType.phone,
        ),
      ],
    );
  }
}
