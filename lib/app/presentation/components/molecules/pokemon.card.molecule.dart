import 'package:flutter/material.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';
import 'package:heb/app/injector.dart';
import 'package:heb/app/presentation/components/atoms/image.atom.dart';
import 'package:heb/core/config/size/size.config.dart';
import 'package:heb/core/extensions/localization.extension.dart';
import 'package:heb/core/extensions/text.extension.dart';

class PokemonCardMolecule extends StatelessWidget {
  const PokemonCardMolecule({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

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
                ImageMolecule(
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
              child: ElevatedButton(
                onPressed: () {},
                child: Text(context.l10n.appTitle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
