import 'package:flutter_forge/exports/basic_exports.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    this.title,
    required this.icon,
    this.onTap,
    this.textColor,
    this.width,
    this.iconBadge,
    this.colorButton,
  });
  final String? title;
  final FaIcon icon;
  final GestureTapCallback? onTap;
  final Color? textColor;
  final double? width;
  final Icon? iconBadge;
  final Color? colorButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: colorButton ?? Colors.transparent,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              if (iconBadge == null) icon,
              if (iconBadge != null)
                SizedBox(
                  width: 50.0, // Ajuste o tamanho conforme necessário
                  height: 24.0, // Ajuste o tamanho conforme necessário
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Positioned(top: 0, left: 0, child: icon),
                      Positioned(top: 0, left: 26, child: iconBadge!),
                    ],
                  ),
                ),
              if (title != null)
                LabelWidget(
                  title: title!,
                  fontSize: 12,
                  textColor: textColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
