import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';

class WCard extends StatelessWidget {
  const WCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.highPrimaryAccenColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("ð"),
          Text("Horror", style: TextStyle(
            fontSize: 12
          ),)
        ],
      ),
    );
  }
}
