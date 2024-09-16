import 'package:flutter/material.dart';

class AnimationProvider extends ChangeNotifier {
  bool _ishoverd = false;
  bool get ishoverd => _ishoverd;

  void setHovered(bool value) {
    _ishoverd = value;
    notifyListeners();
  }
}
