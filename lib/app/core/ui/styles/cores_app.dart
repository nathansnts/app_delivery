import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();

    return _instance!;
  }

  Color get primary => const Color(0xFF19C53B);
  Color get secundary => const Color(0xFFF88B0C);
}

extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
