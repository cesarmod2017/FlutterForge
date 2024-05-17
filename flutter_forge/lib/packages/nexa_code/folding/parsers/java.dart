import 'package:flutter_forge/packages/nexa_code/folding/parsers/highlight.dart';
import 'package:highlight/highlight.dart';

import '../../code/code_lines.dart';
import 'abstract.dart';
import 'java_fallback.dart';

class JavaFoldableBlockParser extends AbstractFoldableBlockParser {
  @override
  void parse({
    required Result highlighted,
    required Set<Object?> serviceCommentsSources,
    CodeLines lines = CodeLines.empty,
  }) {
    final textParser = highlighted.language == null
        ? JavaFallbackFoldableBlockParser()
        : HighlightFoldableBlockParser();
    textParser.parse(
      highlighted: highlighted,
      serviceCommentsSources: serviceCommentsSources,
      lines: lines,
    );

    blocks.addAll(textParser.blocks);
    invalidBlocks.addAll(textParser.invalidBlocks);
  }
}
