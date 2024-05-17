import 'package:flutter/cupertino.dart';
import 'package:flutter_forge/packages/nexa_code/code_field/code_controller.dart';

class OutdentIntent extends Intent {
  const OutdentIntent();
}

class OutdentIntentAction extends Action<OutdentIntent> {
  final CodeController controller;

  OutdentIntentAction({
    required this.controller,
  });

  @override
  Object? invoke(OutdentIntent intent) {
    controller.outdentSelection();

    return null;
  }
}
