import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:networking_project/data/authentication_data.dart';
import 'package:networking_project/data/authentication_response.dart';
import '../data/controller.dart';
import 'package:http/http.dart' as http;

Future<AuthenticationResponse> loginSubmit(
    String email, String password) async {
  final http.Response response =
      await http.post(Uri.parse('http://localhost:8080/api/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
          }));
  if (response.statusCode == 200) {
    //var data = jsonDecode(response.body);
    // var headerdata = response.headers.toString();
    // print(headerdata);
    // print(data['jwtToken']);
    return AuthenticationResponse(
      success: true,
      authenticationData:
          AuthenticationData.fromJson(jsonDecode(response.body)),
    );
  } else {
    return AuthenticationResponse(success: false);
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final storage = GetStorage();

  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              "Email id",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email id",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Obx(
              () => TextField(
                obscureText: loginController.hiddenPass.value,
                controller: passController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: const OutlineInputBorder(),
                  suffix: InkWell(
                    child: Icon(
                      loginController.hiddenPass.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: loginController.hiddenPass.value
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    onTap: () {
                      loginController.hiddenPass.value =
                          !loginController.hiddenPass.value;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  AuthenticationResponse authenticationResponse =
                      await loginSubmit(
                    emailController.text,
                    passController.text,
                  );

                  String? jwtToken =
                      authenticationResponse.authenticationData?.jwtToken;
                  // print(loginToken);
                  print(authenticationResponse.success);
                  //print(authenticationResponse.authenticationData?.jwtToken);
                  if (authenticationResponse.success) {
                    storage.write('jwtToken', jwtToken);
                    // authenticationResponse.authenticationData?.jwtToken);
                    Get.toNamed('/dashboard');
                  } else {
                    Get.defaultDialog(title: "InVaild Login Credentials");
                  }
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








// Future<AuthenticationResponse> loginSubmit(
//     String email, String password) async {
//   final http.Response response =
//       await http.post(Uri.parse('http://localhost:8080/api/login'),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//           body: jsonEncode(<String, String>{
//             'email': email,
//             'password': password,
//           }));
//   if (response.statusCode == 200) {
//     //var data = jsonDecode(response.body);
//     // var headerdata = response.headers.toString();
//     // print(headerdata);
//     // print(data['jwtToken']);
//     return AuthenticationResponse(
//       success: true,
//       authenticationData:
//           AuthenticationData.fromJson(jsonDecode(response.body)),
//     );
//   } else
//     return AuthenticationResponse(success: false);
// }

// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);

//   final LoginController loginController = Get.put(LoginController());
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(title: Text("Login Screen")),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             Text(
//               "Email id",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: "Email id",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Password",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Obx(
//               () => TextField(
//                 obscureText: loginController.hiddenPass.value,
//                 controller: passController,
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                   border: OutlineInputBorder(),
//                   suffix: InkWell(
//                     child: Icon(
//                       loginController.hiddenPass.value
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                       color: loginController.hiddenPass.value
//                           ? Colors.blue
//                           : Colors.grey,
//                     ),
//                     onTap: () {
//                       loginController.hiddenPass.value =
//                           !loginController.hiddenPass.value;
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Container(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   AuthenticationResponse authenticationResponse =
//                       await loginSubmit(
//                           emailController.text, passController.text);
//                   var pass = emailController.text;
//                   var token =
//                       authenticationResponse.authenticationData?.jwtToken;
//                   print(token);
//                   print(authenticationResponse.success);
//                   //print(authenticationResponse.authenticationData?.jwtToken);
//                   if (authenticationResponse.success) {
//                     Get.toNamed('/dashboard?accept=$token&pass=$pass');
//                   } else {
//                     Get.defaultDialog(title: "InVaild Login Credentials");
//                   }
//                 },
//                 child: Text("Submit"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






// Future<AuthenticationResponse> loginSubmit(
//     String email, String password) async {
//   final http.Response response =
//       await http.post(Uri.parse('http://localhost:8080/api/login'),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//           body: jsonEncode(<String, String>{
//             'email': email,
//             'password': password,
//           }));
//   if (response.statusCode == 200) {
//     //var data = jsonDecode(response.body);
//     // var headerdata = response.headers.toString();
//     // print(headerdata);
//     // print(data['jwtToken']);
//     return AuthenticationResponse(
//       success: true,
//       authenticationData:
//           AuthenticationData.fromJson(jsonDecode(response.body)),
//     );
//   } else
//     return AuthenticationResponse(success: false);
// }

// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);

//   final LoginController loginController = Get.put(LoginController());
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(title: Text("Login Screen")),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             Text(
//               "Email id",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: "Email id",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Password",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Obx(
//               () => TextField(
//                 obscureText: loginController.hiddenPass.value,
//                 controller: passController,
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                   border: OutlineInputBorder(),
//                   suffix: InkWell(
//                     child: Icon(
//                       loginController.hiddenPass.value
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                       color: loginController.hiddenPass.value
//                           ? Colors.blue
//                           : Colors.grey,
//                     ),
//                     onTap: () {
//                       loginController.hiddenPass.value =
//                           !loginController.hiddenPass.value;
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Container(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   AuthenticationResponse authenticationResponse =
//                       await loginSubmit(
//                           emailController.text, passController.text);
//                   var pass = emailController.text;
//                   var accept =
//                       authenticationResponse.authenticationData?.jwtToken;
//                   print(accept);
//                   print(authenticationResponse.success);
//                   //print(authenticationResponse.authenticationData?.jwtToken);
//                   if (authenticationResponse.success) {
//                     Get.toNamed('/dashboard?accept=$accept&pass=$pass');
//                   } else {
//                     Get.defaultDialog(title: "InVaild Login Credentials");
//                   }
//                 },
//                 child: Text("Submit"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
