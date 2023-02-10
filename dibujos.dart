import 'package:flutter/material.dart';

class ClipImagen extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height - 38, 40, size.height - 48);
    path.lineTo(size.width -40, size.height -140);
    path.quadraticBezierTo(size.width, size.height -150, size.width, size.height -214);
    path.lineTo(size.width, 0);

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}