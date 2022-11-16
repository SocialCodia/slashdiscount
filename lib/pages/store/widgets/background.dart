import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class Background extends StatelessWidget {
  final String? banner;
  final Widget child;

  const Background({Key? key, required this.child, this.banner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CachedNetworkImage(
          height: size.height * .22,
          width: size.width,
          fit: BoxFit.cover,
          imageUrl: banner.toString(),
          placeholder: (context, url) =>
              Image.asset(Constants.placeHolderBannerImage),
          errorWidget: (context, url, error) =>
              Image.asset(Constants.placeHolderBannerImage),
        ),
        child
      ],
    );
  }
}