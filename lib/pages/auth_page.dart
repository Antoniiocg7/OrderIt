import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_it/pages/home_page.dart';
import 'package:order_it/pages/login_or_register_page.dart';
import 'package:order_it/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          
          //IS USER LOGGED IN
          if(snapshot.hasData){
            return HomePage();
          }

          //USER NOT LOGGED IN
          else{
            return LoginOrRegisterPage();
          }

        },
      ),
    );
  }
}