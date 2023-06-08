import 'package:flutter/material.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';
import 'package:heb/app/presentation/components/molecules/pokemon.card.molecule.dart';
import 'package:heb/app/presentation/components/molecules/pokemon_loading.card.molecule.dart';

class PokemonListOrganism extends StatelessWidget {
  const PokemonListOrganism({
    super.key,
    this.count = 10,
    required this.loading,
    required this.list,
  });

  final bool loading;
  final int count;
  final List<Pokemon> list;

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
        itemCount: list.length,
        itemBuilder: (BuildContext _, int index) {
          if (list[index].loading) {
            return const PokemonLoadingCardMolecule();
          } else {
            return PokemonCardMolecule(pokemon: list[index]);
          }
        },
      );
    }
  }
}
