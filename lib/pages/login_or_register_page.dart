import 'package:flutter/material.dart';
import 'package:order_it/pages/login_page.dart';
import 'package:order_it/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {

  //INITIALLY SHOW LOGIN PAGE
  bool showLoginPage = true;

  //TOGGLE BETWEEN LOGIN AND REGISTER PAGES
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if(showLoginPage){
      return LoginPage(
        onTap: togglePages
      );

    }else{
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}