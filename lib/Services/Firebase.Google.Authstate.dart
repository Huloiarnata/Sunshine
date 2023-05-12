import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/Screen/Home.Screen.dart';
import 'package:sunshine/Screen/Landing.Screen.dart';
import 'package:sunshine/UserData/GoogleUserData.dart';

class AuthProvider{
  handleAuthState(){
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasData){
            GoogleUserInfo userData = GoogleUserInfo(
                userName: snapshot.data?.displayName,
                userEmail: snapshot.data?.email,
                userPhoneNumber: snapshot.data?.phoneNumber,
                userPhotoUrl: snapshot.data?.photoURL);
            return  HomeScreen(userInfo: userData);
          }else{
            return const LandingScreen();
          }
        }
    );
  }
}