import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/routes.dart';
import 'package:i_cine_app/screens/movies/widgets/movie_header.dart';
import 'package:i_cine_app/widgets/card/w_card.dart';
import 'package:i_cine_app/widgets/common/social_bloc.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';
import 'package:i_cine_app/widgets/heading/w_text_large.dart';
import 'package:i_cine_app/widgets/navigation/custom_app_bar.dart';

import '../../constants/colors.dart';
import '../../helpers/screen_args.dart';
import '../../widgets/actions/w_button.dart';
import '../../widgets/common/social_login.dart';
class BookingTicketScreen extends StatefulWidget {
  const BookingTicketScreen({Key? key}) : super(key: key);

  @override
  State<BookingTicketScreen> createState() => _BookingTicketScreenState();
}

class _BookingTicketScreenState extends State<BookingTicketScreen> {
  bool isLoading = false;


  _makePayment()  {
    // verify login session

    // or show login request
    showModalBottomSheet(
        backgroundColor: Colors.black54,
        context: context,
        builder: (context) => RequestLogin()
    );

    //validate payment  and make booking

  }

  void _checkIN(String bookingId) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => CheckInScreee()
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BookingArgs;
    final movie = args.args['movie'];
    final seats = args.args['selectedSeatIds'] as List<int>;
    final seatCounts = seats.length;
    const price = 10000;

    String calcPriceStr(int prince, int seatCounts) {
      return (prince*seatCounts).toString()+ "MGA";
    }

    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                          MovieHeader(movie: movie),

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
              ],
            ),

            //pay button
            // Container(
            //   child: WButton(
            //     text: "Payer maintenant",
            //     color: AppColors.accentColor,
            //     isLoading: isLoading,
            //     onPressedHandler: () =>  _makePayment(),
            //   ),
            // )
            Container(
              child: WButton(
                text: "Check-IN",
                color: AppColors.accentColor,
                isLoading: isLoading,
                onPressedHandler: () =>  _checkIN("1"),
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

class CheckInScreee extends StatelessWidget {
  const CheckInScreee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      height: 650,
      decoration: BoxDecoration(
          color: Colors.white,
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
                    WText(text: "Status du ticket", color: Colors.black, size: 20,),
                    Container(
                        child: GestureDetector(
                            onTap: () => {
                              Navigator.pop(context)
                            },
                            child: Row(
                              children: [
                                Icon(Icons.qr_code_scanner_outlined, size: 30,color: Colors.black,),
                                SizedBox(width: 10,),
                                Icon(Icons.download_outlined, size: 30,color: Colors.black,),
                              ],
                            )
                        )
                    )
                  ],
                ),
                SizedBox(height: 40,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WTextLarge(text: "Reservation confirmee", color: Colors.green,),
                    WText(text: "Nous vous remercions de votre confiance.\nUtiliser le scanner pour le Check-IN le jour jour de la diffusion."),
                    Icon(Icons.check_circle, color: Colors.green, size: 70,),
                  ],
                ),
                SizedBox(height: 65),
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

        ],
      ),
    );
  }
}


class RequestLogin extends StatelessWidget {
  const RequestLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        padding: EdgeInsets.all(40),
        height: 450,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.lock, size: 50),

              Container(
                child: Column(
                  children: [
                    WText(text: "Vous devez vous connecter pour pouvoir continuer votre achat"),
                    SizedBox(height: 40,),
                    WButton(text: "Se connecter maintenant", color: AppColors.accentColor, onPressedHandler: () {
                      goTo(context, '/login', null);
                    } )
                  ],
                ),
              ),
              //fake social login
              SocialBlock()
            ],
          ),
        ),
      ),
    );
  }
}



