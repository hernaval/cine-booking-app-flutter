import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/screens/movies/widgets/movie_header.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';

import '../../widgets/actions/w_button.dart';

class BookingSeatScreen extends StatelessWidget {
  const BookingSeatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          MovieHeader(),
          SizedBox(height: 40,),

          // screen
          Container(
            width: double.maxFinite,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 50,),

          // seat
          Wrap(
            children: List.generate(50, (index) {
              return Seat();
            })
            ,
          ),

          SizedBox(height: 30,),
          // seat legend
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SeatLegend("Vos choix", AppColors.accentColor),
              SeatLegend("Reserve", Colors.grey),
              SeatLegend("Libre", Colors.transparent)
            ],
          ),
          SizedBox(height: 40,),
          Container(
            child: WButton(
              text: "Confirmer",
              color: AppColors.accentColor,
            ),
          )
        ],
      ),
    );
  }
  
  Widget SeatLegend(String legend, Color color) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Seat(
          size: 15,
          color: color,
        ),
        WText(text: legend)
      ],
    );
  }
}

class Seat extends StatelessWidget {
  final Color color;
  final double size;

  Seat({this.color = Colors.transparent, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.only(right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
              width: 1,
              color: Colors.white
          ),
          borderRadius: BorderRadius.circular(5.0)
      ),
    );
  }
}

