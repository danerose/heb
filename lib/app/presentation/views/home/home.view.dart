import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:heb/app/presentation/bloc/pokemons/pokemon.bloc.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemon.state.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemons.event.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonBloc>(
      create: (_) => PokemonBloc()..add(PokemonLoadList()),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<PokemonBloc, PokemonState>(
            builder: (BuildContext _, PokemonState state) {
              switch (state) {
                case PokemonLoadingState():
                  return const Text('loading');
                case PokemonLoadedState():
                  return Text(state.list[0]);
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
