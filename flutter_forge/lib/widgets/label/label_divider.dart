import 'package:flutter_forge/exports/basic_exports.dart';

class LabelDivider extends StatelessWidget {
  const LabelDivider({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Divider(
              height: 50,
            ),
          ),
          10.toWidthSpace(),
          LabelWidget(
            title: title,
          ),
          10.toWidthSpace(),
          const Expanded(
            child: Divider(
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
