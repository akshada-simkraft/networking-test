import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter ToDos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: Text("Login")),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/register');
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}




//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter ToDos"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   Get.to(
//                     () => LoginScreen(),
//                   );
//                 },
//                 child: Text("Login")),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 Get.to(
//                   () => RegistrationScreen(),
//                 );
//               },
//               child: Text("Register"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
