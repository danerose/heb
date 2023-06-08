import 'dart:ui';

import 'package:heb/core/constants/colors.constants.dart';

extension StringCasingExtension on String {
  String toCapitalize() {
    return isNotEmpty
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }

  Color toTypeColor() {
    final colors = <String, Color>{
      'normal': ColorsConstants.normal,
      'fire': ColorsConstants.fire,
      'water': ColorsConstants.water,
      'electric': ColorsConstants.electric,
      'grass': ColorsConstants.grass,
      'ice': ColorsConstants.ice,
      'fighting': ColorsConstants.fighting,
      'poison': ColorsConstants.poison,
      'ground': ColorsConstants.ground,
      'flying': ColorsConstants.flying,
      'psychic': ColorsConstants.psychic,
      'bug': ColorsConstants.bug,
      'rock': ColorsConstants.rock,
      'ghost': ColorsConstants.ghost,
      'dragon': ColorsConstants.dragon,
      'dark': ColorsConstants.dark,
      'steel': ColorsConstants.steel,
      'fairy': ColorsConstants.fairy,
    };
    return colors[this] ?? ColorsConstants.normal;
  }
}
