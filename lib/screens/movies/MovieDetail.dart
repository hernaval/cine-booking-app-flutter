import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/screens/movies/widgets/movie_header.dart';
import 'package:i_cine_app/widgets/actions/w_button.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';
import 'package:i_cine_app/widgets/heading/w_text_large.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      height: 650,
      decoration: BoxDecoration(
          color: Colors.black45.withOpacity(0.40),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top label with close icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WText(text: "Selectionner votre film",),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 2,
                                color: AppColors.mainTextColor
                            )
                        ),
                        child: Icon(Icons.close_rounded, size: 16,)
                    )
                  ],
                ),
                SizedBox(height: 20,),
                // info
                MovieHeader(),

                SizedBox(height: 40,),

                // movie resume
                WTextLarge(text: "Synopsis", size: 20,),
                SizedBox(height: 10,),
                WText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                    " sed do eiusmod tempor incididunt "
                    "ut labore et dolore magna aliqua"
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                    " sed do eiusmod tempor incididunt "
                    "ut labore et dolore magna aliqua", size: 12,),

                SizedBox(height: 30,),
                // cast
                WTextLarge(text: "Acteurs", size: 20,),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(4, (index) {
                        return Container(
                          margin: EdgeInsets.only(right: 20,),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/evans.jpg"),
                                  fit: BoxFit.cover
                              ),
                              shape: BoxShape.circle
                          ),
                        );
                      })
                      ,
                    ),
                  ],
                ),

                SizedBox(height: 30,),
                // cast
                WTextLarge(text: "Code promo", size: 20,),


              ],
            ),
          ),


          // book button
          Container(
            child: WButton(
              text: "Reservez maintenant",
              color: AppColors.accentColor,
            ),
          )
        ],
      ),
    );
  }
}
