import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthService{
// SignIn Function
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential;
  }
// SignOut function
  signOutGoogle()async{
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

}