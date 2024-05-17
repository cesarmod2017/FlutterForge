import 'package:flutter_forge/exports/basic_exports.dart';

class CustomTextFillField extends StatelessWidget {
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool? isPassword;
  final String? label;
  final String? hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? trailingTap;
  final TextInputType? keyboardType;

  const CustomTextFillField({
    super.key,
    this.leadingIcon,
    this.trailingIcon,
    this.isPassword,
    this.label,
    this.hintText,
    required this.controller,
    this.onChanged,
    this.trailingTap,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) LabelWidget(title: label!, textColor: Colors.grey),
        Row(
          children: <Widget>[
            if (leadingIcon != null) Icon(leadingIcon, color: Colors.grey),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: isPassword ?? false,
                keyboardType: keyboardType ?? TextInputType.text,
                decoration: InputDecoration(
                  hintText: hintText,
                  filled: true,
                  isDense: true,
                  fillColor: const Color.fromRGBO(245, 245, 245, 1),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                ),
                onChanged: onChanged,
              ),
            ),
            if (trailingIcon != null)
              GestureDetector(
                onTap: trailingTap,
                child: Icon(trailingIcon, color: Colors.grey),
              ),
          ],
        ),
      ],
    );
  }
}
