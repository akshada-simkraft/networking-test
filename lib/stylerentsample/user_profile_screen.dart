import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserProfileScreen extends StatelessWidget {
  final GoogleSignInAccount userdata;

  const UserProfileScreen({Key? key, required this.userdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text('profile'),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: userdata.photoUrl != null
                  ? NetworkImage(userdata.photoUrl!)
                  : null,
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Name :' + userdata.displayName!),
            const SizedBox(
              height: 8,
            ),
            Text('Email :' + userdata.email),
          ],
        ),
      ),
    );
  }
}
