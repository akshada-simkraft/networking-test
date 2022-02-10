import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:networking_project/api/google_signin.dart';
import 'logedin_screen.dart';

class SRSigninScreen extends StatelessWidget {
  SRSigninScreen({Key? key}) : super(key: key);
  bool isChecked = true;

  // signIn() async {
  //   print('in signin');
  //   GoogleSignIn _googleSignIn = GoogleSignIn();

  //   var result = await _googleSignIn.signIn();

  //   print(result);
  // }

  Future signIn() async {
    final GoogleSignInAccount? user = await GoogleSignInApi.login();
    print(user);
    if (user == null) {
      Get.snackbar('Message', 'Sign in failed');
    } else {
      Get.to(() => LoggedInScreen(userdata: user));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "StyleRent",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/srlogo.jpg'),
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                "Marketing Text/Tag Line",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                'Sign Up to Get Started',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                fixedSize: const Size(330, 40),
                side: const BorderSide(color: Colors.black),
              ),
              onPressed: signIn,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/google.jpg',
                    width: 55,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Continue With Google',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                'Already have an account? Sign in',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'By signing up you accept the ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => print('Clicked on Terms of Service'),
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                          const TextSpan(
                            text: ' & ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
