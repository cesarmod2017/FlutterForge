import 'package:flutter/material.dart';
import 'package:flutter_forge/core/extensions/export.dart';
import 'package:flutter_forge/widgets/label/label_widget.dart';

class LabelWithProgressWidget extends StatelessWidget {
  const LabelWithProgressWidget(
      {super.key,
      required this.fontSize,
      required this.title,
      required this.isProgress});
  final double fontSize;
  final String title;
  final bool isProgress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LabelWidget(
          title: title,
          fontSize: fontSize,
        ),
        10.toWidthSpace(),
        if (isProgress)
          const SizedBox(
            height: 16.0,
            width: 16.0,
            child: CircularProgressIndicator.adaptive(),
          ),
      ],
    );
  }
}
