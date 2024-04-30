import 'package:flutter/material.dart';

class ImagePlaceHolder extends StatelessWidget {
  final String? imageUrl;
  const ImagePlaceHolder({
    this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      // 'lib/images/image1.png',
      imageUrl!,
      fit: BoxFit.cover,
    );
  }
}
