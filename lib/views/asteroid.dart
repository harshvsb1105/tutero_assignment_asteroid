import 'dart:math';

import 'package:flutter/material.dart';

class Asteroid extends StatelessWidget {
  final String asteroidImage;
  const Asteroid({required this.asteroidImage});

  @override
  Widget build(BuildContext context) {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 100,
        width: 100,
        child: Image.asset(
            "images/$asteroidImage.png"),
      );
  }
}
