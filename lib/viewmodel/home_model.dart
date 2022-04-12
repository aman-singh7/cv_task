import 'package:cv_task/constant/enums/view_state.dart';
import 'package:cv_task/viewmodel/base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeModel extends BaseModel {
  late final String content;
  late final AutoScrollController controller;

  bool _showSearchBar = false;

  bool get showSearchBar => _showSearchBar;

  set showSearchBar(bool val) {
    _showSearchBar = val;
    notifyListeners();
  }

  String _searchText = '';

  String get searchText => _searchText;

  set searchText(String val) {
    _searchText = val;
    notifyListeners();
  }

  void reset() {
    _showSearchBar = false;
    _searchText = '';
    notifyListeners();
  }

  void onModelReady(double bottom) async {
    setState(ViewState.busy);
    content = await rootBundle.loadString('lib/constant/test.md');
    controller = AutoScrollController(
        viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, bottom - 10),
        axis: Axis.vertical);
    setState(ViewState.idle);
  }
}
