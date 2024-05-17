import 'package:flutter/services.dart';
import 'package:flutter_forge/core/formatters/date_formatter.dart';
import 'package:flutter_forge/exports/basic_exports.dart';

class CustomTextFieldDate extends StatelessWidget {
  final IconData? leadingIcon;
  final bool? isPassword;
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onChangedCalendar;
  final GestureTapCallback? trailingTap;
  final String? label;
  const CustomTextFieldDate({
    super.key,
    this.leadingIcon,
    this.isPassword,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.onChangedCalendar,
    this.trailingTap,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: Column(
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
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.only(left: 10.0),
                    hintText: hint,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: onChanged,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DateInputFormatter(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onChangedCalendar,
                child: const Icon(FontAwesomeIcons.calendarDay,
                    color: Colors.blue),
              ),
              15.toWidthSpace(),
              GestureDetector(
                onTap: trailingTap,
                child: const Icon(FontAwesomeIcons.check, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
