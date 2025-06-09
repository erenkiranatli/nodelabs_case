import 'package:flutter/material.dart';

class SizeConst {
  static late double width;
  static late double height;

  static void initSize() {
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    final size = view.physicalSize;
    width = size.width / view.devicePixelRatio;
    height = size.height / view.devicePixelRatio;
  }
}
