import 'package:heb/core/enviroment/env.dart';
import 'package:heb/core/enum/enviroments.enum.dart';

class DevelopmentEnv implements Environments {
  @override
  String get apiURL => 'https://pokeapi.co/api/v2/pokemon';

  @override
  EnviromentEnum get env => EnviromentEnum.development;
}
