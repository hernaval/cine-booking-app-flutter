import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/constants/routes.dart';
import 'package:i_cine_app/data/repositories/auth_repository.dart';
import 'package:i_cine_app/data/services/impl/auth_repository_impl.dart';
import 'package:i_cine_app/data/services/local_service.dart';
import 'package:i_cine_app/helpers/screen_args.dart';
import 'package:i_cine_app/widgets/actions/w_button.dart';
import 'package:i_cine_app/widgets/common/social_bloc.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';
import 'package:i_cine_app/widgets/heading/w_text_large.dart';

import '../../models/auth.dart';
import '../../widgets/common/social_login.dart';
import '../../widgets/controls/w_text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  final IAuthRepository authRepository = AuthRepositoryImpl(LocalService());
  bool isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _handleLogin() async {
    setState(() {
      isLoading = true;
    });

    final authPayload = Auth(_emailController.text, _passwordController.text);

    final response = await authRepository.login(authPayload);

    print(response);

    setState(() {
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          // logo
          WTextLarge(text: "LOGO"),

          Container(
            padding: EdgeInsets.all(70),
            child: Column(
              children: [
                // input username
                WTextInput(label:"Nom d'utilisateur", hintText: "test@testcom", icon: Icons.email_outlined, controller: _emailController,),
                SizedBox(height: 30,),
                // input password
                WTextInput(label:"Mot de passe", isSecure: true, hintText: "dsf", icon: Icons.lock_open_outlined, controller: _passwordController,),
              ],
            ),
          ),
         
          //or text

          WButton(text: "Se connecter", color: AppColors.accentColor, onPressedHandler: () => _handleLogin, isLoading: isLoading,),

          SocialBlock()
        ]

      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
