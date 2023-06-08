import 'package:flutter/material.dart';
import 'package:heb/app/injector.dart';
import 'package:heb/core/config/size/size.config.dart';
import 'package:skeletons/skeletons.dart';

class PokemonLoadingCardMolecule extends StatelessWidget {
  const PokemonLoadingCardMolecule({super.key});

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
                SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: injector.get<SizeConfig>().sizeH * 20,
                    height: injector.get<SizeConfig>().sizeH * 20,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 10,
                          width: injector.get<SizeConfig>().sizeH * 30,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 20,
                              width: injector.get<SizeConfig>().sizeH * 20,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(width: 10),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 20,
                              width: injector.get<SizeConfig>().sizeH * 20,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: SkeletonLine(
                style: SkeletonLineStyle(
                  height: 20,
                  width: injector.get<SizeConfig>().sizeH * 100,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
