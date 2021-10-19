import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final double borderRadius;
  final String? imageUrl;

  const RoundedImage({
    Key? key,
    required this.borderRadius,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl == '') {
      return const SizedBox();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        imageUrl!,
      ),
    );
  }
}