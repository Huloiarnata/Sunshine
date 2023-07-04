import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sunshine/Services/MongoDb.Service/MongoDB.Services.dart';
import 'package:sunshine/UserData/GoogleUserData.dart';

class AuthService{
// SignIn Function
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    await MongoDBServices.connect();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);
    _insertData(
        userCredential.user!.uid,
        userCredential.user!.displayName.toString(),
        userCredential.user!.email.toString(),
        userCredential.user!.phoneNumber.toString(),
        userCredential.user!.photoURL.toString()
    );
    return userCredential;
  }
// SignOut function
  signOutGoogle()async{
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  Future<void> _insertData(
      String userUID,
      String userName,
      String userEmail,
      String userPhoneNumber,
      String userPhotoUrl
      ) async {
    final data = GoogleUserInfo(
        uid: userUID,
        userName: userName,
        userEmail: userEmail,
        userPhoneNumber: userPhoneNumber,
        userPhotoUrl: userPhotoUrl
    );
     await MongoDBServices.insert(data);
    log("Data Inserted Successfully");
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text("Inserted id: " + id.$oid)));
  }
}