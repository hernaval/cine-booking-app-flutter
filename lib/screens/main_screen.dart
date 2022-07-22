import 'package:flutter/material.dart';
import 'package:i_cine_app/screens/booking/booking_list_screen.dart';
import 'package:i_cine_app/screens/booking/booking_screen.dart';
import 'package:i_cine_app/screens/booking/booking_seat_screen.dart';
import 'package:i_cine_app/screens/booking/booking_payment_screen.dart';
import 'package:i_cine_app/screens/home/home_screen.dart';
import 'package:i_cine_app/widgets/navigation/custom_app_bar.dart';
import 'package:i_cine_app/widgets/navigation/custom_bottom_navigation_bar.dart';

import 'movies/movies_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List _pages = [
    HomeScreen(),
    MoviesScreen(),
    BookingListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTapHandler: (index) {
          setState(() => currentIndex = index);
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: _pages[currentIndex],
      ),
    );
  }
}
