import 'package:flutter/material.dart';
import 'package:heb/core/constants/icons.constants.dart';

class PokeBallIconAtom extends StatelessWidget {
  const PokeBallIconAtom({
    super.key,
    this.height = 20,
    this.width = 20,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IconsConstants.pokeball),
        ),
      ),
    );
  }
}
