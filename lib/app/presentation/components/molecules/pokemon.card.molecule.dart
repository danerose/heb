import 'package:flutter/material.dart';
import 'package:heb/app/injector.dart';
import 'package:heb/core/config/size/size.config.dart';
import 'package:heb/core/extensions/localization.extension.dart';
import 'package:heb/core/extensions/text.extension.dart';

import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';

import 'package:heb/app/presentation/components/atoms/images/image.atom.dart';

class PokemonCardMolecule extends StatelessWidget {
  const PokemonCardMolecule({
    super.key,
    required this.pokemon,
    required this.allowToAdd,
    required this.add,
  });

  final Pokemon pokemon;
  final bool allowToAdd;
  final Function(Pokemon pokemon) add;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ImageAtom(
                  url: pokemon.detail.sprite.front,
                  width: injector.get<SizeConfig>().sizeH * 20,
                  height: injector.get<SizeConfig>().sizeH * 20,
                  borderRadius: BorderRadius.circular(10),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(pokemon.name.toCapitalize()),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            pokemon.detail.type.length,
                            (i) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Chip(
                                  backgroundColor: pokemon
                                      .detail.type[i].detail.name
                                      .toTypeColor(),
                                  label: Text(
                                    pokemon.detail.type[i].detail.name,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: SizedBox(
                width: injector.get<SizeConfig>().sizeH * 100,
                child: Visibility(
                  visible: allowToAdd,
                  replacement: ElevatedButton(
                    onPressed: null,
                    child: Text(context.l10n.yourTeamIsComplete),
                  ),
                  child: ElevatedButton(
                    onPressed: pokemon.onTeam ? null : () => add(pokemon),
                    child: Text(
                      pokemon.onTeam
                          ? context.l10n.alreadyPartOfYuorTeam
                          : context.l10n.addToMyTeam,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
