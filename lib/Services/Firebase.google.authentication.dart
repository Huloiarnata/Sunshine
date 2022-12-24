import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/screens/home.dart';
import 'package:sunshine/screens/landing.dart';
class AuthService{
// SignIn Function
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
handleAuthState(){
  return StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (BuildContext context,snapshot){
      if(snapshot.hasData){
        return const HomeScreen();
      }else{
        return const LandingScreen();
      }
    }
  );
}
// SignOut function
signOutGoogle()async{
  await GoogleSignIn().disconnect();
  FirebaseAuth.instance.signOut();
}
}