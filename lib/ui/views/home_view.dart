import 'package:cv_task/constant/enums/view_state.dart';
import 'package:cv_task/ui/builders/highlight_builder.dart';
import 'package:cv_task/ui/components/text_input.dart';
import 'package:cv_task/ui/syntaxes/highlight_syntax.dart';
import 'package:cv_task/ui/views/base_view.dart';
import 'package:cv_task/viewmodel/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.onModelReady(MediaQuery.of(context).padding.bottom);
      },
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: model.showSearchBar
                ? AppBar(
                    leading: IconButton(
                      onPressed: () {
                        model.reset();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    leadingWidth: 35,
                    title: TextInput(
                      onChanged: (value) {
                        model.searchText = value;
                        model.controller.scrollToIndex(0);
                      },
                      action: TextInputAction.search,
                      border: InputBorder.none,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      hint: 'Search...',
                    ),
                    backgroundColor: Colors.white,
                  )
                : AppBar(
                    title: const Text('Markdown'),
                    actions: [
                      IconButton(
                        onPressed: () {
                          model.showSearchBar = true;
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
            body: model.state == ViewState.idle
                ? SingleChildScrollView(
                    controller: model.controller,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Column(
                        children: [
                          MarkdownBody(
                            key: UniqueKey(),
                            data: model.content,
                            builders: {
                              'highlight': HighlightBuilder(
                                controller: model.controller,
                                occurenceCountCb: (count) {},
                                selectable: false,
                              ),
                            },
                            extensionSet: md.ExtensionSet(
                              [
                                ...md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                              ],
                              [
                                if (model.searchText.isNotEmpty)
                                  HighlightSyntax(model.searchText),
                                md.EmojiSyntax(),
                                ...md
                                    .ExtensionSet.gitHubFlavored.inlineSyntaxes,
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}
