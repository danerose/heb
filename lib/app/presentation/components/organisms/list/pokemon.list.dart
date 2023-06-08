import 'package:flutter/material.dart';

import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';

import 'package:heb/app/presentation/components/molecules/pokemon.card.molecule.dart';
import 'package:heb/app/presentation/components/molecules/pokemon_loading.card.molecule.dart';
import 'package:heb/core/extensions/localization.extension.dart';

class PokemonListOrganism extends StatelessWidget {
  const PokemonListOrganism({
    super.key,
    this.count = 10,
    required this.next,
    required this.loading,
    required this.list,
    required this.team,
    required this.add,
  });

  final bool loading;
  final int count;
  final String next;
  final List<Pokemon> list;
  final List<Pokemon> team;
  final Function(Pokemon pokemon) add;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext _, int index) {
          return const PokemonLoadingCardMolecule();
        },
      );
    } else {
      return ListView.builder(
        itemCount: list.length + 1,
        itemBuilder: (BuildContext _, int index) {
          // return Text('index $index lenght ${list.length}');
          if (index < list.length) {
            return PokemonCardMolecule(
              pokemon: list[index],
              allowToAdd: team.length < 5,
              add: (pokemon) => add(pokemon),
            );
          } else {
            return Visibility(
              visible: next.isNotEmpty,
              child: TextButton(
                onPressed: () {},
                child: Text(context.l10n.loadMore),
              ),
            );
          }
        },
      );
    }
  }
}
