import 'package:flutter_forge/exports/basic_exports.dart';

extension WidgetExtension on dynamic {
  Widget toHeightSpace() {
    return SizedBox(height: double.parse(toString()));
  }

  Widget toWidthSpace() {
    return SizedBox(width: double.parse(toString()));
  }

  Widget centerWidget() {
    return Center(child: this);
  }
}
