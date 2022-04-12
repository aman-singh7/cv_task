// ignore_for_file: unused_field

import 'package:markdown/markdown.dart' as md;

class HighlightSyntax extends md.InlineSyntax {
  HighlightSyntax(this._pattern) : super(_pattern);
  final String _pattern;

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    if (match[0] != null) {
      parser.addNode(md.Element.text('highlight', match[0]!.trim()));
    }

    return true;
  }
}
