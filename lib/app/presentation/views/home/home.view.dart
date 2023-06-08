import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heb/app/domain/usecases/get_pokemon_detail.usecase.dart';
import 'package:heb/app/injector.dart';

import 'package:heb/app/domain/usecases/get_pokemon_list.usecase.dart';

import 'package:heb/app/presentation/bloc/pokemons/pokemon.bloc.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemon.state.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemons.event.dart';
import 'package:heb/app/presentation/components/atoms/icons/pokeball.icon.dart';

import 'package:heb/app/presentation/components/organisms/list/pokemon.list.dart';
import 'package:heb/core/extensions/localization.extension.dart';

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
        appBar: AppBar(
          title: Text(context.l10n.pokemonExchange),
          actions: [
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (BuildContext context, PokemonState state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Badge(
                        isLabelVisible: true,
                        label: Text('2'),
                        alignment: Alignment(-2.5, 2.5),
                        child: PokeBallIcon(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
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
