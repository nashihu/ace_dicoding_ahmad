import 'package:flutter/material.dart';

BuildContext? currentContext;

extension SizerExt on int {
  double get h {
    return MediaQuery.of(currentContext!).size.height * this / 100;
  }

  double get w {
    return MediaQuery.of(currentContext!).size.width * this / 100;
  }
}
