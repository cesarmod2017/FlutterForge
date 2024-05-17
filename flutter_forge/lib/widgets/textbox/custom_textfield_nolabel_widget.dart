import 'package:flutter_forge/exports/basic_exports.dart';

class CustomTextNoLabelField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? textInputType;
  final bool? enabled;
  final FocusNode? focusNode;
  const CustomTextNoLabelField({
    super.key,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.textInputType,
    this.enabled,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      focusNode: focusNode,
      obscureText: false,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        contentPadding: const EdgeInsets.all(4),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1, // Define a espessura da borda
            color: Colors.grey,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.blue,
          ),
        ),
      ),
      textAlign: TextAlign.center,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
