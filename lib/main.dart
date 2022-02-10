import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:networking_project/screens/homescreen.dart';
import 'package:networking_project/screens/profiledetails.dart';
import 'package:networking_project/stylerentsample/logedin_screen.dart';
import 'data/sample.dart';
import 'sample/deletedata.dart';
import 'sample/intdropdowntest.dart';
import 'screens/login.dart';
import 'screens/dashboard.dart';
import 'sample/mfdropdowntest.dart';
import 'screens/registration.dart';
import 'sample/sample.dart';
import 'sample/senddata.dart';
import 'stylerentsample/signin_screen.dart';

// Future<void> main() async {
//   await GetStorage.init();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final GetStorage storage = GetStorage();
//     String? jwtToken = storage.read<String?>('token');
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       //if the user is already login goto dashboard else goto initial route
//       initialRoute: jwtToken != null ? '/dashboard' : '/',
//       getPages: [
//         GetPage(name: "/", page: () => HomeScreen()),
//         GetPage(name: "/login", page: () => LoginScreen()),
//         GetPage(name: "/dashboard", page: () => DashBoard()),
//         GetPage(name: "/register", page: () => Registration()),
//         GetPage(name: '/profiledetails', page: () => ProfileScreen()),
//         // GetPage(name: "/update", page: () => UpdateScreen()),
//       ],
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SRSigninScreen(),
    );
  }
  // ghghjg
}
