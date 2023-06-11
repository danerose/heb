import 'package:flutter/material.dart';
import 'package:heb/app/injector.dart';

import 'package:heb/core/config/size/size.config.dart';
import 'package:heb/core/extensions/localization.extension.dart';

import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';

import 'package:heb/app/presentation/components/atoms/images/image.atom.dart';

class PokemonTeamDialogOrganism extends StatelessWidget {
  const PokemonTeamDialogOrganism({
    super.key,
    required this.team,
    required this.onDelete,
  });

  final List<Pokemon> team;
  final Function(Pokemon pokemon) onDelete;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          Visibility(
            visible: team.isNotEmpty,
            replacement: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(context.l10n.yourTeamIsEmpty),
            ),
            child: Column(
              children: List.generate(team.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    dense: true,
                    leading: ImageAtom(
                      url: team[index].detail.sprite.front,
                      width: injector.get<SizeConfig>().sizeH * 10,
                      height: injector.get<SizeConfig>().sizeH * 10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    trailing: IconButton(
                      onPressed: () => onDelete(team[index]),
                      icon: const Icon(Icons.delete_forever),
                    ),
                    title: Text(team[index].name),
                  ),
                );
              }),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(context.l10n.close),
          )
        ],
      ),
    );
  }
}
