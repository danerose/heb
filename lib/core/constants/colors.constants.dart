import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:heb/core/enum/enviroments.enum.dart';

class ColorsConstants {
  final EnviromentEnum env;
  const ColorsConstants({required this.env});

  Color get primary {
    switch (env) {
      case EnviromentEnum.development:
        return Colors.deepPurple;
      case EnviromentEnum.staging:
        return Colors.amber;
      default:
        return Colors.pinkAccent[200] ?? Colors.pink;
    }
  }

  Color get second {
    switch (env) {
      case EnviromentEnum.development:
        return const Color.fromARGB(255, 197, 97, 255);
      case EnviromentEnum.staging:
        return const Color.fromARGB(255, 138, 118, 255);
      default:
        return Colors.black;
    }
  }

  Color get input {
    switch (env) {
      case EnviromentEnum.development:
        return const Color.fromARGB(255, 69, 0, 109);
      case EnviromentEnum.staging:
        return const Color.fromARGB(255, 44, 26, 146);
      default:
        return const Color.fromARGB(255, 255, 141, 208);
    }
  }

  static const Color background = Color.fromARGB(255, 31, 24, 31);
  static const Color textAlt = Color.fromARGB(255, 163, 137, 163);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color disabled = Color.fromARGB(255, 212, 205, 205);
  static const Color grey = Color.fromARGB(255, 100, 100, 100);
  static const Color transparent = Color.fromARGB(0, 255, 255, 255);
  static const Color success = Color.fromRGBO(102, 206, 106, 1);
  static const Color error = Color.fromRGBO(244, 62, 80, 1);
  static const Color warning = Color.fromRGBO(196, 160, 3, 1);
}
