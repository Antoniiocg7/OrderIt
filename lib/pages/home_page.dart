import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  //SIGN USER OUT METHOD

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: signUserOut, 
            icon: const Icon(Icons.logout)
          )
        ],
      ),
      body:  Center(
        child: Text(
          "¡ Has iniciado sesión como: ${user?.email} !",
          style: const TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }
}