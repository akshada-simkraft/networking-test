import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:networking_project/stylerentsample/user_profile_screen.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignin = GoogleSignIn();

  Future userlogin() async {
    GoogleSignInAccount? userdata = await _googleSignin.signIn();
    print(userdata);
    if (userdata == null) {
      Get.snackbar('Message', 'Sign in failed');
    } else {
      Get.to(() => UserProfileScreen(userdata: userdata));
    }
  }

  userlogout() {
    _googleSignin.disconnect();
  }
}
