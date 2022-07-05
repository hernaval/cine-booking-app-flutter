import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';

class WText extends StatelessWidget {
  double size;
  final String text;
  final Color color;



  WText({this.size=16, required this.text, this.color = const Color(0xFFababad)});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      color: color,
      fontSize: size
    ),);
  }
}
