import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "../utils/asset_paths.dart";

class ScreenBackground extends StatelessWidget {
 const ScreenBackground({super.key, required this.child});

 final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetPaths.backgroundSVG,
          fit: BoxFit.cover,
          height: double.maxFinite,
          width: double.maxFinite,
        ),
        child,
      ],
    );
  }
}
