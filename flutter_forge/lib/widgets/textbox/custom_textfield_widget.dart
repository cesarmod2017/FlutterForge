import 'package:flutter_forge/exports/basic_exports.dart';

class CustomTextField extends StatelessWidget {
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool? isPassword;
  final String? hint;
  final String? labelText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? trailingTap;
  final String? label;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    this.leadingIcon,
    this.trailingIcon,
    this.isPassword,
    this.hint,
    required this.controller,
    this.onChanged,
    this.trailingTap,
    this.label,
    this.labelText,
    this.keyboardType,
    this.readOnly,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LabelWidget(
              title: label!,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        TextFormField(
          controller: controller,
          obscureText: isPassword ?? false,
          readOnly: readOnly ?? false,
          validator: validator,
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            isDense: true,
            labelText: labelText,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: trailingIcon != null
                ? IconButton(
                    icon: Icon(
                      trailingIcon,
                    ),
                    onPressed: trailingTap,
                  )
                : null,
          ),
          onChanged: onChanged,
          keyboardType: keyboardType ?? TextInputType.text,
        ),
      ],
    );
  }
}
