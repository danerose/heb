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

  //type colors

  static const Color normal = Color(0xffa8a77a);
  static const Color fire = Color(0xffee8130);
  static const Color water = Color(0xff6390f0);
  static const Color electric = Color(0xfff7d02c);
  static const Color grass = Color(0xff7ac74c);
  static const Color ice = Color(0xff96d9d6);
  static const Color fighting = Color(0xffc22e28);
  static const Color poison = Color(0xffa33ea1);
  static const Color ground = Color(0xffe2bf65);
  static const Color flying = Color(0xffa98ff3);
  static const Color psychic = Color(0xfff95587);
  static const Color bug = Color(0xffa6b91a);
  static const Color rock = Color(0xffb6a136);
  static const Color ghost = Color(0xff735797);
  static const Color dragon = Color(0xff6f35fc);
  static const Color dark = Color(0xff705746);
  static const Color steel = Color(0xffb7b7ce);
  static const Color fairy = Color(0xffd685ad);
}
