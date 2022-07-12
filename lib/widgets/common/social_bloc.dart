import 'package:flutter/material.dart';
import 'package:i_cine_app/widgets/common/social_login.dart';

import '../heading/w_text.dart';

class SocialBlock extends StatelessWidget {
  const SocialBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        WText(text: "OU", color: Colors.white70,),
        WText(text: "Utiliser les reseaux sociaux", color: Colors.white70.withOpacity(0.5), size: 12,),
        SizedBox(height: 30,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialLogin(icon: Icons.facebook_outlined),
            SocialLogin(icon: Icons.facebook_outlined),
            SocialLogin(icon: Icons.facebook_outlined),
          ],
        ),
      ],
    );
  }
}
