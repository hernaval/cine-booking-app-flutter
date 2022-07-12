import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SocialLogin extends StatelessWidget {
  final IconData icon;


  SocialLogin({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: AppColors.accentColor
          ),
          shape: BoxShape.circle
      ),
      child: Icon(icon, size: 30,),
    );
  }
}
