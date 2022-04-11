import 'package:cv_task/constant/enums/view_state.dart';
import 'package:flutter/foundation.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
