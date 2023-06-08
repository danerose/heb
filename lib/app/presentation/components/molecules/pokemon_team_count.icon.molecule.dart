import 'package:flutter/material.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';
import 'package:heb/app/presentation/components/atoms/icons/pokeball.icon.dart';

class PokemonTeamCountIconMolecule extends StatelessWidget {
  const PokemonTeamCountIconMolecule({
    super.key,
    required this.team,
    required this.onTap,
  });

  final List<Pokemon> team;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Badge(
            isLabelVisible: team.isNotEmpty,
            label: Text(team.length.toString()),
            alignment: const Alignment(-2.5, 2.5),
            child: const PokeBallIconAtom(
              height: 30,
              width: 30,
            ),
          ),
        ),
      ),
    );
  }
}
