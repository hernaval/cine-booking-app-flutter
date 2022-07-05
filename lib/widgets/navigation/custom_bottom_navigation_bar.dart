import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: "Browse", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Ticket", icon: Icon(Icons.theaters_rounded)),
          BottomNavigationBarItem(label: "Profil", icon: Icon(Icons.person)),
        ]
    );
  }
}
