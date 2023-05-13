import 'package:flutter/material.dart';

import '../../Services/Firebase.Google.Authentication.dart';
class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Log Out'),
        onPressed: () =>AuthService().signOutGoogle(),
      ),
    );
  }
}
