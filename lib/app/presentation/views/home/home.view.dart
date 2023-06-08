import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:heb/app/injector.dart';
import 'package:heb/core/extensions/localization.extension.dart';

import 'package:heb/app/domain/usecases/get_pokemon_list.usecase.dart';
import 'package:heb/app/domain/usecases/get_pokemon_detail.usecase.dart';

import 'package:heb/app/presentation/bloc/pokemons/pokemon.bloc.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemon.state.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemons.event.dart';

import 'package:heb/app/presentation/components/organisms/list/pokemon.list.dart';
import 'package:heb/app/presentation/components/molecules/pokemon_team_count.icon.molecule.dart';

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
                return PokemonTeamCountIconMolecule(
                  team: state.team,
                  onTap: () {},
                );
              },
            )
          ],
        ),
        body: Center(
          child: BlocBuilder<PokemonBloc, PokemonState>(
            builder: (BuildContext context, PokemonState state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      context.l10n.selectUpToPokemon,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Expanded(
                    child: PokemonListOrganism(
                      loading: state.loading,
                      list: state.list,
                      team: state.team,
                      add: (pokemon) {
                        if (state.team.length < 5) {
                          context
                              .read<PokemonBloc>()
                              .add(PokemonAddToTeam(pokemon: pokemon));
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
