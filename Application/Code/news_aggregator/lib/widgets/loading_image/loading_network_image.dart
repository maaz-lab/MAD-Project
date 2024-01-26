import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LoadingNetworkImage extends StatelessWidget {
  const LoadingNetworkImage(
      {super.key,
      this.image,
      this.boxfit,
      this.height,
      this.width,
      this.color,
      this.filterquality = FilterQuality.high});
  final String? image;
  final BoxFit? boxfit;
  final double? width, height;
  final Color? color;
  final FilterQuality filterquality;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: image!,
        imageBuilder: (context, imageProvider) {
          return Image(
            image: imageProvider,
            filterQuality: filterquality,
            fit: boxfit ?? BoxFit.fill,
            color: color,
            width: width,
            height: height,
          );
        },
        errorListener: (value) {
          debugPrint('loading image error: $value');
        },
        placeholder: (context, url) => SkeletonAnimation(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              shimmerColor: Colors.white,
              shimmerDuration: 1000,
              curve: Curves.decelerate,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12)))),
            ),
        errorWidget: (context, url, error) => Image.asset(
              "assets/image/no-image.png",
              height: height,
              width: width,
            ));
  }
}
