import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';

import '../../models/movie.dart';

enum CardTypeMode {
    portrait,
    landscape
}
class MovieCard extends StatelessWidget {
  final CardTypeMode mode;
  final Movie movie;
  final Function? onTapHandler;

   MovieCard({ required this.mode, required this.movie, this.onTapHandler });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () => onTapHandler!(movie),
      hoverColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: mode == CardTypeMode.landscape ? 350 : 150,
              height: 240,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(movie.posterUrl),
                      fit:  BoxFit.cover
                  )
              ),
            ),
            if(mode == CardTypeMode.portrait) Container(
              margin: EdgeInsets.only(top: 5, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WText(text: movie.title, size: 14,),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(Icons.star, color: AppColors.accentColor, size: 15,);
                        })
                        ,
                      ),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
