import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/widgets/widgets_exports.dart';

class CheckBoxHorizontalWidget extends StatelessWidget {
  const CheckBoxHorizontalWidget({
    super.key,
    required this.items,
  });
  final List<CheckboxItem> items;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: items.map((item) {
          return Row(
            children: [
              Checkbox(
                value: item.value,
                onChanged: item.onChanged,
                tristate: false,
                checkColor: Colors.blue,
                activeColor: Colors.blue.shade500,
              ),
              GestureDetector(
                  onTap: () {
                    item.onChanged(!item.value);
                  },
                  child: LabelWidget(
                    title: item.label,
                    fontSize: item.labelSize ?? 12,
                  )),
            ],
          );
        }).toList(),
      ),
    );
  }
}
