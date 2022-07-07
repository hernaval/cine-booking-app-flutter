import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.highPrimaryAccenColor,
      // leading: Icon(Icons.apps),
      // actions: [
      //   Icon(Icons.search, size: 30,)
      // ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}
