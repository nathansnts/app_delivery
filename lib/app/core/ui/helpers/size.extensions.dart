import 'package:flutter/cupertino.dart';

extension SizeExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeigth => MediaQuery.of(this).size.height;

  double percentWith(double percent) => screenWidth * percent;

  double percentHeight(double percent) => screenHeigth * percent;
}
