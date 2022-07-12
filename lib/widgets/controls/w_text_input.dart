import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';

class WTextInput extends StatelessWidget {
  final String? hintText;
  final bool isSecure;
  final IconData icon;
  final TextEditingController? controller;
  final String label;

  WTextInput({ this.hintText, this.isSecure = false,  required this.icon,  this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WText(text: label),
        SizedBox(height: 5.0,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 0.7,
                color: AppColors.mainTextColor
              )
            ),
            child: TextField(
              controller: controller,
              cursorColor: AppColors.accentColor,
              style: TextStyle(
                color: AppColors.accentColor.withOpacity(0.7)
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.3)
                ),
                icon: Icon(icon, color: AppColors.accentColor,),
                // suffixIcon: isSecure ? Icon(Icons.visibility) : Icon(Icons.no_accounts)
              ),
            ),
        ),
      ],
    );
  }
}
