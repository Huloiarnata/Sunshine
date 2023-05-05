import 'package:flutter/material.dart';

class LoadingAuth extends StatelessWidget {
  const LoadingAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: Colors.black,
        ),
      ),
    );;
  }
}
