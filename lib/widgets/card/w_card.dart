import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';

enum WCardType {
  inline,
  multiline,
}

class WCard extends StatelessWidget {
  final double width;
  final double height;
  final List<String> texts;
  final WCardType wCardType;
  final bool selected;


  WCard({this.width = 70, this.height = 60, required this.texts, this.wCardType = WCardType.multiline, this.selected=false });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: selected ? AppColors.accentColor : AppColors.primaryColor
      ),
      child: wCardType == WCardType.multiline
          ?
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for(String t in texts) Text(t, style: TextStyle(
            fontSize: 10
          ),)
        ],
      )
          :
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for(String t in texts) Text(t, style: TextStyle(
              fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }
}
