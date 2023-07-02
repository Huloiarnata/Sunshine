import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/Screen/Splash.Screen.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Sunshine());
}

class Sunshine extends StatelessWidget {
  const Sunshine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}