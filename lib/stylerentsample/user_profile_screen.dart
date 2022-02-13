import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:networking_project/api/google_signin.dart';
import 'package:networking_project/controller/login_controller.dart';

class UserProfileScreen extends StatelessWidget {
  final GoogleSignInAccount userdata;
  UserProfileScreen({Key? key, required this.userdata}) : super(key: key);

  AuthController signInController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () async {
              await signInController.userlogout();
              Get.back();
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          )
        ],
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:networking_project/api/google_signin.dart';

// class UserProfileScreen extends StatelessWidget {
//   final GoogleSignInAccount userdata;

//   const UserProfileScreen({Key? key, required this.userdata}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         actions: [
//           TextButton(
//             onPressed: () async {
//               await GoogleSignInApi.logout();
//               Get.back();
//             },
//             child: const Text(
//               'Logout',
//               style: TextStyle(color: Colors.black, fontSize: 20),
//             ),
//           )
//         ],
//         title: const Text(
//           'User Profile',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('profile'),
//             const SizedBox(
//               height: 20,
//             ),
//             CircleAvatar(
//               radius: 40,
//               backgroundImage: userdata.photoUrl != null
//                   ? NetworkImage(userdata.photoUrl!)
//                   : null,
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Text('Name :' + userdata.displayName!),
//             const SizedBox(
//               height: 8,
//             ),
//             Text('Email :' + userdata.email),
//           ],
//         ),
//       ),
//     );
//   }
// }
