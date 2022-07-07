import 'package:flutter/material.dart';
import 'package:i_cine_app/screens/movies/widgets/movie_header.dart';
import 'package:i_cine_app/widgets/card/w_card.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';
import 'package:i_cine_app/widgets/heading/w_text_large.dart';
import 'package:i_cine_app/widgets/navigation/custom_app_bar.dart';

import '../../constants/colors.dart';
import '../../helpers/screen_args.dart';
import '../../widgets/actions/w_button.dart';
class BookingTicketScreen extends StatelessWidget {
  const BookingTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BookingArgs;
    final movie = args.args['movie'];
    final seats = args.args['selectedSeatIds'] as List<int>;
    final seatCounts = seats.length;
    final price = 10000;

    String calcPriceStr(int prince, int seatCounts) {
      return (prince*seatCounts).toString()+ "MGA";
    }

    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      // movie header
                      MovieHeader(movie: movie,),

                      // princing information
                      SizedBox(height: 60,),

                      Column(
                        children: [
                          PriceInfo("Total", calcPriceStr(price, seatCounts), isTitle: true),
                          PriceInfo("Tickets (2)", calcPriceStr(price, seatCounts)),
                          PriceInfo("Reservation", "12-07-2022, 10:00"),
                          PriceInfo("Coupon", ">", isTitle: true),
                        ],
                      )

                      // pay button
                    ],
                  ),
                ),
                //Left circle cut
                Positioned(
                  left: -25,
                  child: SizedBox(
                    height: 20,
                    width: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                    ),
                  ),
                ),

                //Right circle cut
                Positioned(
                  right: -25,
                  child: SizedBox(
                    height: 20,
                    width: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF303030),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.0,),
            // payment method
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WTextLarge(text: "Choisissez votre moyen de paiement", size: 12, color: Colors.black,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WCard(
                          texts: ["Mvola"],
                      ),
                      WCard(
                          texts: ["Orange money"]
                      ),
                      WCard(
                          texts: ["VISA"]
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 40),

            //pay button
            Container(
              child: WButton(
                text: "Payer maintenant",
                color: AppColors.accentColor,
                onPressedHandler: () {

                },
              ),
            )
          ],
        ),
      ),
    );
  }
  
  Widget PriceInfo(String label, String value, {bool isTitle = false}) {

    Widget TextLabeled(String txt, bool isBold) {
      return !isBold ?
      WText(text: txt, size: 12,
        color: Colors.black45,
      ) :
      WTextLarge(text: txt, size: 12,
        color: Colors.black,
      )
      ;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextLabeled(label, isTitle),
          TextLabeled(value, isTitle),
        ],
      ),
    );
  }
}
