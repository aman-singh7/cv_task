import 'package:cv_task/constant/enums/view_state.dart';
import 'package:cv_task/viewmodel/base_model.dart';
import 'package:flutter/services.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeModel extends BaseModel {
  late final String content;
  String searchText = '';
  late final AutoScrollController controller;

  bool _showSearchBar = false;

  bool get showSearchBar => _showSearchBar;

  set showSearchBar(bool val) {
    _showSearchBar = val;
    notifyListeners();
  }

  void onModelReady() async {
    setState(ViewState.busy);
    content = await rootBundle.loadString('lib/constant/test.md');
    controller = AutoScrollController();
    setState(ViewState.idle);
  }
}
