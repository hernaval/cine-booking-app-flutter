import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';

class WButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressedHandler;
  final bool isLoading;

  WButton({ required this.text, required this.color, required this.onPressedHandler, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        onPressed: () => onPressedHandler(),
        style: ButtonStyle(
          minimumSize: isLoading ? MaterialStateProperty.all(Size(50, 50)) : MaterialStateProperty.all(Size(300, 40)),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 10, horizontal: 10)
          ),
          shape: isLoading ? MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.white, width: 3)
                )
            ) : null ,
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: isLoading ? CircularProgressIndicator(color: AppColors.mainTextColor,) :  WText(
          text: text,
          size: 16,
          color: Colors.white,
        )
    );
  }
}
