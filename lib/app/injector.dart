import 'package:get_it/get_it.dart';
import 'package:heb/core/enviroment/env.dart';
import 'package:heb/core/config/size/size.config.dart';

final injector = GetIt.instance;

Future<void> init(Environments env) async {
  injector.registerSingleton<Environments>(env);
  injector.registerSingleton<SizeConfig>(SizeConfig());
}
