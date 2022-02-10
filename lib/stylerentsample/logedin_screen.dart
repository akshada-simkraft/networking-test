import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoggedInScreen extends StatelessWidget {
  final GoogleSignInAccount userdata;

  const LoggedInScreen({Key? key, required this.userdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text('profile'),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: userdata.photoUrl != null
                    ? NetworkImage(userdata.photoUrl!)
                    : null,
              ),
              SizedBox(
                height: 8,
              ),
              Text('Name :' + userdata.displayName!),
              SizedBox(
                height: 8,
              ),
              Text('Email :' + userdata.email),
            ],
          )),
    );
  }
}
