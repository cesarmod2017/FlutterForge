import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/widgets/widgets_exports.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    this.titleButtom,
    this.height,
    this.width,
    this.onTap,
    this.child,
    this.isLoading = false,
    this.borderRadius,
    this.buttonColor,
    this.titleFontSize,
  });

  final String? titleButtom;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Widget? child;
  final bool? isLoading;
  final double? borderRadius;
  final Color? buttonColor;
  final double? titleFontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.sizeOf(context).width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
              ),
            ),
            elevation: MaterialStateProperty.all(3)),
        onPressed: !isLoading! ? onTap : null,
        child: !isLoading!
            ? child ??
                Text(
                  titleButtom!,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: titleFontSize,
                  ),
                )
            : const LoadingButtonChildWidget(),
      ),
    );
  }
}
