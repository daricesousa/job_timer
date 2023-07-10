import 'package:flutter/material.dart';

extension ColorExt on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  ThemeData get theme => Theme.of(this);
}
