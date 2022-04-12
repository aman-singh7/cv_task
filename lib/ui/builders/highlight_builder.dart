import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:scroll_to_index/scroll_to_index.dart';

typedef CountCb = void Function(int);

class HighlightBuilder extends MarkdownElementBuilder {
  HighlightBuilder({
    required this.controller,
    required this.occurenceCountCb,
    this.selectable = true,
  });

  final AutoScrollController controller;
  final CountCb occurenceCountCb;
  final bool selectable;
  var index = 0;

  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var text = element.textContent;

    preferredStyle ??= const TextStyle();

    var widget = selectable
        ? SelectableText(
            text,
            style: preferredStyle,
          )
        : Text(
            text,
            style: preferredStyle,
          );

    occurenceCountCb(++index);

    return AutoScrollTag(
      key: ValueKey(index),
      controller: controller,
      color: Colors.yellowAccent,
      highlightColor: Colors.orangeAccent,
      index: index,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: widget,
      ),
    );
  }
}
