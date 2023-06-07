import 'package:flutter/material.dart';
import 'package:heb/core/config/theme/dark.theme.dart';
import 'package:heb/core/config/theme/light.theme.dart';

class CustomTheme {
  static ThemeData light() {
    return pokemonLight;
  }

  static ThemeData dark() {
    return pokemonDark;
  }
}
