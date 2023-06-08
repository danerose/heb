import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:heb/app/injector.dart';
import 'package:heb/core/extensions/localization.extension.dart';

import 'package:heb/app/domain/usecases/get_pokemon_list.usecase.dart';
import 'package:heb/app/domain/usecases/get_pokemon_detail.usecase.dart';

import 'package:heb/app/presentation/bloc/pokemons/pokemon.bloc.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemon.state.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemons.event.dart';

import 'package:heb/app/presentation/components/atoms/icons/pokeball.icon.dart';
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
        appBar: AppBar(
          title: Text(context.l10n.pokemonExchange),
          actions: [
            BlocBuilder<PokemonBloc, PokemonState>(
              buildWhen: (p, c) => p.team != c.team,
              builder: (BuildContext context, PokemonState state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Badge(
                        isLabelVisible: state.team.isNotEmpty,
                        label: Text(state.team.length.toString()),
                        alignment: const Alignment(-2.5, 2.5),
                        child: const PokeBallIcon(
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
            builder: (BuildContext context, PokemonState state) {
              return PokemonListOrganism(
                loading: state.loading,
                list: state.list,
                add: (pokemon) {
                  if (state.team.length < 5) {
                    context
                        .read<PokemonBloc>()
                        .add(PokemonAddToTeam(pokemon: pokemon));
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
