import 'package:flutter/material.dart';
import 'dart:math' as math;


class KegelArc extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    var path = Path();
    Rect rect = Rect.fromLTWH(0.0, size.height/2, size.width, size.height);
    path.arcTo(rect, 0.0, -math.pi, true);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}