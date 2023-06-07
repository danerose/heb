import 'package:flutter/material.dart';
import 'package:heb/app/injector.dart';
import 'package:heb/core/constants/colors.constants.dart';

final ThemeData pokemonLight = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: injector.get<ColorsConstants>().primary,
    brightness: Brightness.light,
  ),
);
