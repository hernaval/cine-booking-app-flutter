import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';

class WButton extends StatelessWidget {
  final Color color;
  final String text;


  WButton({ required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {},
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 30, horizontal: 10)
          ),
          backgroundColor: MaterialStateProperty.all(color)
        ),
        child: WText(
          text: "Reservez maintenant",
          size: 16,
          color: Colors.white,
        )
    );
  }
}
