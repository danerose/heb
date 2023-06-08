import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:heb/core/constants/colors.constants.dart';

class ImageMolecule extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const ImageMolecule({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.fit = BoxFit.scaleDown,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (url == '') {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(100),
          color: ColorsConstants.grey.withOpacity(0.2),
        ),
        child: const Center(
          child: Icon(
            Icons.format_overline,
            color: ColorsConstants.grey,
          ),
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (BuildContext context, dynamic imageProvider) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsConstants.black.withOpacity(0.6),
                    ),
                  ),
                  Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: fit,
                      ),
                    ),
                  ),
                ],
              );
            },
            placeholder: (BuildContext context, String url) {
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(100),
                  color: ColorsConstants.grey.withOpacity(0.2),
                ),
                child: Center(
                  child: SizedBox(
                    width: width / 3,
                    height: height / 3,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              );
            },
            errorWidget: (BuildContext context, String url, dynamic error) {
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(100),
                  color: ColorsConstants.grey.withOpacity(0.2),
                ),
                child: const Center(
                  child: Icon(
                    Icons.format_overline,
                    color: ColorsConstants.grey,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
