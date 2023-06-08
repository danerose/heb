import 'package:flutter/material.dart';
import 'package:heb/app/injector.dart';
import 'package:heb/core/constants/colors.constants.dart';

final ThemeData pokemonDark = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.fromSeed(
    seedColor: injector.get<ColorsConstants>().primary,
    brightness: Brightness.dark,
  ),
);
