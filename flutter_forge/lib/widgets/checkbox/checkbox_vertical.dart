import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/widgets/widgets_exports.dart';

class CheckBoxVerticalWidget extends StatelessWidget {
  const CheckBoxVerticalWidget({
    super.key,
    required this.item,
    this.width,
  });
  final CheckboxItem item;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: GestureDetector(
          onTap: () {
            item.onChanged(!item.value);
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  color: Colors.transparent,
                ),
                width: 20,
                height: 20,
                child: item.value
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
              3.toHeightSpace(),
              Text(
                item.label,
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
