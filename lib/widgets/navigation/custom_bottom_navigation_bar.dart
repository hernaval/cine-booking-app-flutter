import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function onTapHandler;


  CustomBottomNavigationBar({required this.currentIndex, required this.onTapHandler});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.accentColor,
        // unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) {
            onTapHandler(index);
        },
        items: [
          BottomNavigationBarItem(label: "Browse", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Ticket", icon: Icon(Icons.theaters_rounded)),
          BottomNavigationBarItem(label: "Profil", icon: Icon(Icons.person)),
        ]
    );
  }
}
