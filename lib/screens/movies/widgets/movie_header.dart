import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/widgets/actions/w_button.dart';
import 'package:i_cine_app/widgets/card/movie_card.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';
import 'package:i_cine_app/widgets/heading/w_text_large.dart';

import '../../../models/movie.dart';

class MovieHeader extends StatelessWidget {
  final Movie? movie;
  const MovieHeader({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // poster
          Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainTextColor,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ]
            ),
            child: Image.network(movie!.posterUrl,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),

          //info
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // title
                WTextLarge(text: movie!.title, size: 22),

                // version
                WText(text: movie!.category, size:  12,),

                // salle
                WText(text: "3D, 3D MAX", size:  12,),

                // trailer button
                Row(
                    children: [
                      Icon(Icons.play_circle_outline_sharp ),
                      Text("Regarder la bande annonce")
                    ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
