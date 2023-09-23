
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{

  //GOOGLE SIGN IN
  signInWithGoogle() async{
    //BEGIN INTERACTIVE SIGN IN
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //OBTAIN AUNTH DETAILS FROM REQUEST
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //CREATE A NEW CREDENTIAL FOR THE USER
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );

    //FINALLY SING IN
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }
}