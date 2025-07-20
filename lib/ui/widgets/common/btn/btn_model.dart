import 'package:stacked/stacked.dart';

class BtnModel extends BaseViewModel {
  bool _hovered = false;

  bool get isHovered => _hovered;

  void setHover(bool value) {
    _hovered = value;
    notifyListeners();
  }
}
