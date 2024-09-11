import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, required this.imageUrl, required this.width, required this.height});

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) =>  Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) =>
      const Icon(Icons.error),
    );
  }
}
