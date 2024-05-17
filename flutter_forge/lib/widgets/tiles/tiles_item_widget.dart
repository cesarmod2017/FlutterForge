import 'package:flutter_forge/core/utils/snackbar_custom.dart';
import 'package:flutter_forge/exports/basic_exports.dart';

class ListTileItemWidget extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;
  const ListTileItemWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: LabelWidget(
        title: title,
        textColor: Colors.black,
        fontSize: 15,
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap ??
          () {
            NotifyCustom.error("Nenhuma ação definida!");
          },
    );
  }
}
