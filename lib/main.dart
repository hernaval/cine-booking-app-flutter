import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/routes.dart';
import 'package:i_cine_app/screens/auth/login_screen.dart';
import 'package:i_cine_app/screens/booking/booking_screen.dart';
import 'package:i_cine_app/screens/booking/booking_seat_screen.dart';
import 'package:i_cine_app/screens/booking/booking_payment_screen.dart';
import 'package:i_cine_app/screens/main_screen.dart';
import 'package:i_cine_app/screens/home/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'i-cine',
      theme: ThemeData.dark(),
      home: LoginScreen(),
      routes: {

        HomeRoute.home: (context) => MainScreen(),
        BookingRoute.booking_payment : (context)  => BookingTicketScreen(),
        BookingRoute.booking_time: (context) => BookingScreen(),
        BookingRoute.booking_seat: (context) => BookingSeatScreen(),

        AuthRoute.login: (context) => LoginScreen(),
      },
    );
  }
}


