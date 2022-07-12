import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/data/repositories/auth_repository.dart';
import 'package:i_cine_app/data/services/impl/auth_repository_impl.dart';
import 'package:i_cine_app/data/services/local_service.dart';
import 'package:i_cine_app/widgets/actions/w_button.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';
import 'package:i_cine_app/widgets/heading/w_text_large.dart';

import '../../models/auth.dart';
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

          WButton(text: "Se connecter", color: AppColors.accentColor, onPressedHandler: _handleLogin, isLoading: isLoading,),
          SizedBox(height: 30,),
          // fake social login
         WText(text: "OU", color: Colors.white70,),
          WText(text: "Utiliser les reseaux sociaux", color: Colors.white70.withOpacity(0.5), size: 12,),
          SizedBox(height: 40,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SocialButton(Icons.facebook_outlined),
              SocialButton(Icons.facebook_outlined),
              SocialButton(Icons.facebook_outlined),
            ],
          )
        ]

      ),
    );
  }

  Widget SocialButton(IconData icon) {
    return  Container(
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }
}
