import 'package:flutter/material.dart';

class WTextLarge extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  WTextLarge({Key? key,  this.size=30, required this.text,  this.color= Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
