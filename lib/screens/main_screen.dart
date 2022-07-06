import 'package:flutter/material.dart';
import 'package:i_cine_app/screens/booking/booking_screen.dart';
import 'package:i_cine_app/screens/booking/booking_seat_screen.dart';
import 'package:i_cine_app/screens/booking/booking_ticket_screen.dart';
import 'package:i_cine_app/screens/home/home_screen.dart';
import 'package:i_cine_app/widgets/navigation/custom_app_bar.dart';
import 'package:i_cine_app/widgets/navigation/custom_bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: HomeScreen(),
      ),
    );
  }
}
