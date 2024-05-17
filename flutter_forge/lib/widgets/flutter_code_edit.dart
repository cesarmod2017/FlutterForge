import 'dart:developer';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_forge/packages/nexacode_packages.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class CodeEditorPage extends StatefulWidget {
  const CodeEditorPage({super.key, required this.controller, this.onChanged});
  final CodeController controller;
  final Function(String)? onChanged;
  @override
  State<CodeEditorPage> createState() => _CodeEditorPageState();
}

class _CodeEditorPageState extends State<CodeEditorPage> {
  final FocusNode _focusNode = FocusNode();
  bool _altPressed = false;

  getSelectedText() {
    TextSelection currentSelection = widget.controller.selection;

    if (currentSelection.isCollapsed) {
      return;
    }

    int start = currentSelection.start;
    int end = currentSelection.end;

    log(widget.controller.text.substring(start, end));
  }

  setNewText(String newValue) {
    final currentSelection = widget.controller.selection;
    final currentText = widget.controller.value.text;
    final newText = currentText.replaceRange(
        currentSelection.start, currentSelection.end, newValue);

    widget.controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: currentSelection.start + 7),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent) {
          // Verifique se a tecla Alt está pressionada
          if (event.logicalKey == LogicalKeyboardKey.altLeft ||
              event.logicalKey == LogicalKeyboardKey.altRight) {
            _altPressed = true;
          }

          // Verifique se a tecla "1" está pressionada enquanto Alt está pressionada
          if (_altPressed && event.logicalKey == LogicalKeyboardKey.digit1) {
            // Coloque aqui o código que deve ser executado quando Alt + 1 é pressionado
            log('Alt + 1 foi pressionado');
            setNewText("@@namespace@@");
          }
        } else if (event is KeyUpEvent) {
          // Verifique se a tecla Alt foi liberada
          if (event.logicalKey == LogicalKeyboardKey.altLeft ||
              event.logicalKey == LogicalKeyboardKey.altRight) {
            _altPressed = false;
          }
        }
      },
      child: CodeTheme(
        data: CodeThemeData(styles: monokaiSublimeTheme),
        child: CodeField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          gutterStyle: const GutterStyle(
            showLineNumbers: true,
            showErrors: true,
          ),
          // textSelectionTheme:
          //     TextSelectionThemeData(selectionColor: Colors.green),
        ),
      ),
    );
  }
}
