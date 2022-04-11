import 'package:cv_task/constant/enums/view_state.dart';
import 'package:cv_task/ui/components/text_input.dart';
import 'package:cv_task/ui/views/base_view.dart';
import 'package:cv_task/viewmodel/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.onModelReady();
      },
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: model.showSearchBar
                ? AppBar(
                    leading: IconButton(
                      onPressed: () {
                        model.showSearchBar = false;
                        model.searchText = '';
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
                      },
                      action: TextInputAction.search,
                      border: InputBorder.none,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      hint: 'Search...',
                    ),
                    actions: const [
                      Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.black,
                      ),
                    ],
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
                ? Markdown(data: model.content)
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}
