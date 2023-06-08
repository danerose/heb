import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heb/app/domain/usecases/get_pokemon_detail.usecase.dart';
import 'package:heb/app/injector.dart';

import 'package:heb/app/domain/usecases/get_pokemon_list.usecase.dart';

import 'package:heb/app/presentation/bloc/pokemons/pokemon.bloc.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemon.state.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemons.event.dart';

import 'package:heb/app/presentation/components/organisms/list/pokemon.list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonBloc>(
      create: (_) => PokemonBloc(
        injector.get<GetPokemonListUsecase>(),
        injector.get<GetPokemonDetailUsecase>(),
      )..add(PokemonLoadList()),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocBuilder<PokemonBloc, PokemonState>(
            buildWhen: (p, c) {
              return p is PokemonLoadingState != c is PokemonLoadingState;
            },
            builder: (BuildContext _, PokemonState state) {
              switch (state) {
                case PokemonLoadingState():
                  return const PokemonListOrganism(loading: true, list: []);
                case PokemonLoadedState():
                  return PokemonListOrganism(loading: false, list: state.list);
                default:
                  return const Text('Some error');
              }
            },
          ),
        ),
      ),
    );
  }
}
