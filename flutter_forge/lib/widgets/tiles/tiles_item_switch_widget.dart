import 'package:flutter_forge/exports/basic_exports.dart';

class ListTileItemSwitchWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;
  const ListTileItemSwitchWidget({
    super.key,
    required this.title,
    this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          title: LabelWidget(
            title: title,
            textColor: Colors.black,
            fontSize: 15,
          ),
          trailing: Switch(
            onChanged: onChanged,
            value: value,
            activeColor: Colors.blue,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
