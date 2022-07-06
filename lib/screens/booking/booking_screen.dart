import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/constants/routes.dart';
import 'package:i_cine_app/helpers/screen_args.dart';
import 'package:i_cine_app/screens/movies/widgets/movie_header.dart';
import 'package:i_cine_app/widgets/card/w_card.dart';
import 'package:i_cine_app/widgets/heading/w_text_large.dart';
import 'package:i_cine_app/widgets/navigation/custom_app_bar.dart';

import '../../models/movie.dart';
import '../../widgets/actions/w_button.dart';
import '../../widgets/heading/w_text.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // movie header with date and time update
                  MovieHeader(),
                  SizedBox(height: 40,),

                  // available date selector
                  WTextLarge(text: "Choisissez une date", size: 20, color: AppColors.mainTextColor,),

                  Wrap(
                        children: List.generate(9, (index) {
                          return Container(
                            margin: EdgeInsets.only(right: 20, bottom: 10),
                            child: WCard(
                                height:  70,
                              texts: ["MAR", "12", "MONDAY"],
                            ),
                          );
                        })
                        ,
                   ),


                  SizedBox(height: 30,),

                  // available time selector
                  WTextLarge(text: "Choisissez une heure", size: 20, color: AppColors.mainTextColor,),
                  Wrap(
                    children: List.generate(9, (index) {
                      return Container(
                        margin: EdgeInsets.only(right: 20, bottom: 10),
                        child: WCard(
                          height:  50,
                          width: 90,
                          wCardType: WCardType.inline,
                          texts: ["12:00", "AM"],
                        ),
                      );
                    })
                    ,
                  ),

                  SizedBox(height: 30,),
                  // button next
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: WButton(
                          text: "Suivant",
                          color: AppColors.accentColor,
                          onPressedHandler: () {
                            goTo(context, BookingRoute.booking_seat, ScreenArgs<String>("bb")
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
        ),
      ),
    );

  }
}
