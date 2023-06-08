import 'package:heb/core/enum/enviroments.enum.dart';

abstract class Environments {
  String get apiURL => '';
  EnviromentEnum get env => EnviromentEnum.none;
}
