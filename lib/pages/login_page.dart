import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_it/components/my_button.dart';
import 'package:order_it/components/my_textfield.dart';
import 'package:order_it/components/square_tile.dart';

class LoginPage extends StatelessWidget {

  //TEXT EDITING CONTROLLERS
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //SIGN USERS IN METHOD

  void signUserIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
    );
  }



  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Icon(
                Icons.fastfood_rounded,
                size: 100,
                color: Colors.grey[900],
              ),
              const SizedBox(height: 50),

              Text(
                "¡Bienvenido! Te echábamos de menos",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
                
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: passwordController,
                hintText: "Contraseña",
                obscureText: true,
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "¿Has olvidado tu contraseña?",
                      style: TextStyle(
                        color: Colors.grey[600]
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 50),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[500],
                    )
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "También puedes continuar con",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),

                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[500],
                    )
                  )
                ],
              ),

              const SizedBox(height: 50),

              //GOOGLE AND APPLE SIGN IN BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [

                  //GOOGLE BUTTON
                  SquareTile(imagePath: "lib/images/google_logo.png"),

                  SizedBox(width: 25),

                  //APPLE BUTTONS
                  SquareTile(imagePath: "lib/images/apple_logo.png"),
                ],
              ),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "¿No eres miembro?",
                    style: TextStyle(
                      color: Colors.grey[700]
                    ),
                  ),

                  const SizedBox(width: 4),
                  
                  const Text(
                    "Regístrate ahora",
                    style: TextStyle(
                      color: Colors.green, 
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}