import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:order_it/components/my_button.dart';
import 'package:order_it/components/my_textfield.dart';
import 'package:order_it/components/square_tile.dart';
import 'package:order_it/services/auth_service.dart';

class RegisterPage extends StatefulWidget {

  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //TEXT EDITING CONTROLLERS
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //SIGN USERS IN METHOD
  void signUserUp() async{

    //SHOW LOADING CIRCLE
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        );
      },
    );

    //TRY CREATING THE USER
    try{
      //CHECK IF PASSWORD IS CONFIRMED
      if(passwordController.text == confirmPasswordController.text){

        await FirebaseAuth.instance.createUserWithEmailAndPassword(

        email: emailController.text, 
        password: passwordController.text
        );

      }else{ //SHOW ERROR MESSAGE

        showErrorMessage("Las contraseñas no son iguales");
      }

      //POP THE CIRCLE
      Navigator.pop(context);

    }on FirebaseAuthException catch (e) {

      //POP THE CIRCLE
      Navigator.pop(context);
      
      //SHOW ERROR MESSAGE 'invalid-email'  'INVALID_LOGIN_CREDENTIALS'
      showErrorMessage(e.code);

    }
  
  }

  //ERROR MESSAGE TO USER
  void showErrorMessage(String message){
    showDialog(
      context: context, 
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.green,
          title: Center(
            child: Text(
              "Email Incorrecto",
              style: TextStyle(color: Colors.white)
            ),
          ),
          
          
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Icon(
                  Icons.fastfood_rounded,
                  size: 100,
                  color: Colors.grey[900],
                ),
                const SizedBox(height: 20),

                //CREATE ACCOUNT MESSAGE
                Text(
                  "¡Bienvenido! Puede crear una cuenta aquí",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                  
                ),
          
                const SizedBox(height: 25),

                //EMAIL TEXTFIELD
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
          
                const SizedBox(height: 10),

                //PASSWORD TEXTFIELD
                MyTextField(
                  controller: passwordController,
                  hintText: "Contraseña",
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                //CONFIRM PASSWORD TEXTFIELD
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirma la Contraseña",
                  obscureText: true,
                ),

          
                const SizedBox(height: 25),
          
                MyButton(
                  onTap: signUserUp,
                  text: "Regístrate",
                ),
          
                const SizedBox(height: 25),
          
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
          
                const SizedBox(height: 25),
          
                //GOOGLE AND APPLE SIGN IN BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          
                    //GOOGLE BUTTON
                    SquareTile(
                      imagePath: "lib/images/google_logo.png",
                      onTap: () => AuthService().signInWithGoogle(),
                      ),
          
                    const SizedBox(width: 25),
          
                    //APPLE BUTTONS
                    SquareTile(
                      imagePath: "lib/images/apple_logo.png",
                      onTap: () {
                        //TODO PENDING APPLE REGISTER
                      },
                    ),
                  ],
                ),
          
                const SizedBox(height: 25),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          
                    Text(
                      "¿Ya tienes una cuenta?",
                      style: TextStyle(
                        color: Colors.grey[700]
                      ),
                    ),
          
                    const SizedBox(width: 4),
                    
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Inicia sesión ahora",
                        style: TextStyle(
                          color: Colors.green, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                )
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}