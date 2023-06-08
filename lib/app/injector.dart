import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:heb/core/enviroment/env.dart';

import 'package:heb/core/config/size/size.config.dart';
import 'package:heb/core/constants/colors.constants.dart';
import 'package:heb/core/services/network/http.service.dart';

import 'package:heb/app/domain/usecases/get_pokemon_list.usecase.dart';
import 'package:heb/app/domain/usecases/get_pokemon_detail.usecase.dart';

import 'package:heb/app/domain/repositories/pokemon.repository.dart';

import 'package:heb/app/data/repositories/pokemon.repository.impl.dart';

import 'package:heb/app/data/datasources/remote/interfaces/pokemon.remote.source.dart';

import 'package:heb/app/data/datasources/remote/implementations/pokemon.remote.source.impl.dart';

final injector = GetIt.instance;

Future<void> init(Environments env) async {
  injector.registerSingleton<Environments>(env);
  injector.registerSingleton<SizeConfig>(SizeConfig());
  injector.registerSingleton<ColorsConstants>(ColorsConstants(env: env.env));
  injector.registerSingleton<HttpService>(
    HttpService(baseUrl: env.apiURL, dio: Dio()),
  );

  injector.registerLazySingleton<PokemonRemoteSource>(
    () => PokemonRemoteSourceImpl(
      httpService: injector.get<HttpService>(),
    ),
  );

  injector.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      pokemonRemoteSource: injector.get<PokemonRemoteSource>(),
    ),
  );

  injector.registerLazySingleton<GetPokemonListUsecase>(
    () => GetPokemonListUsecase(
      pokemonRepository: injector.get<PokemonRepository>(),
    ),
  );
  injector.registerLazySingleton<GetPokemonDetailUsecase>(
    () => GetPokemonDetailUsecase(
      pokemonRepository: injector.get<PokemonRepository>(),
    ),
  );
}
