import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:networking_project/data/authentication_data.dart';
import 'package:http/http.dart ' as http;
import 'package:networking_project/data/authentication_response.dart';
import '../data/authentication_response.dart';
import '../data/controller.dart';

Future<AuthenticationResponse> submitData(String name, String email, String age,
    String? gender, String password) async {
  http.Response response = await http.post(
    Uri.parse('http://localhost:8080/api/registerUser'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String?>{
        'name': name,
        'email': email,
        'age': age,
        'gender': gender,
        'password': password,
      },
    ),
  );

//check the status of the response body
  if (response.statusCode == 200) {
    return AuthenticationResponse(
      success: true,
      authenticationData: AuthenticationData.fromJson(
        jsonDecode(response.body),
      ),
    );
  }
  return AuthenticationResponse(success: false);
}

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final storage = GetStorage();
  final RegisterController registerController = Get.put(RegisterController());

//controller for every textfield
//cant declare inside build method because it will rebuild on every setstate method call
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  String? selectedValue;

  List<GenderItem> genders = [
    GenderItem(null, "Please Select a Gender"),
    GenderItem("f", "Female"),
    GenderItem("m", "Male"),
  ];

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String?>> genderItems = genders.map((genderValue) {
      return DropdownMenuItem(
        value: genderValue.valueofGender,
        child: Text(genderValue.textToShow),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("Name"),
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Email id"),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: "Email id",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Age"),
            TextField(
              controller: agecontroller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: "Age",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Gender"),
            DropdownButton<String?>(
              isExpanded: true,
              value: selectedValue,
              icon: Icon(Icons.arrow_drop_down),
              items: genderItems,
              onChanged: (String? newValue) {
                setState(
                  () {
                    selectedValue = newValue;
                    print(selectedValue);
                  },
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("Password"),
            Obx(
              () => TextField(
                controller: passcontroller,
                obscureText: registerController.hiddenPass.value,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  suffix: InkWell(
                    child: Icon(
                      registerController.hiddenPass.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: registerController.hiddenPass.value
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    onTap: () {
                      registerController.hiddenPass.value =
                          !registerController.hiddenPass.value;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    AuthenticationResponse authenticationResponse =
                        await submitData(
                      namecontroller.text,
                      emailcontroller.text,
                      agecontroller.text,
                      selectedValue,
                      passcontroller.text,
                    );
                    String? jwtToken =
                        authenticationResponse.authenticationData?.jwtToken;
                    if (authenticationResponse.success) {
                      storage.write('jwtToken', jwtToken);
                      Get.toNamed('/dashboard');
                    }
                    // print(authenticationResponse.success);
                    // print(authenticationResponse.authenticationData?.jwtToken);
                  },
                  child: Text("Submit")),
            )
          ],
        ),
      ),
    );
  }
}









// Future<AuthenticationResponse> submitData(String name, String email, String age,
//     String? gender, String password) async {
//   http.Response response =
//       await http.post(Uri.parse('http://localhost:8080/api/registerUser'),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//           body: jsonEncode(
//             <String, String?>{
//               'name': name,
//               'email': email,
//               'age': age,
//               'gender': gender,
//               'password': password,
//             },
//           ));

// //check the status of the response body
//   if (response.statusCode == 200) {
//     return AuthenticationResponse(
//         success: true,
//         authenticationData:
//             AuthenticationData.fromJson(jsonDecode(response.body)));
//   }
//   return AuthenticationResponse(success: false);
// }

// class Registration extends StatefulWidget {
//   const Registration({Key? key}) : super(key: key);

//   @override
//   _RegistrationState createState() => _RegistrationState();
// }

// class _RegistrationState extends State<Registration> {
//   final RegisterController registerController = Get.put(RegisterController());

// //controller for every textfield
// //cant declare inside build method because it will rebuild on every setstate method call
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController agecontroller = TextEditingController();
//   TextEditingController passcontroller = TextEditingController();

//   String? selectedValue;

//   List<GenderItem> genders = [
//     GenderItem(null, "Please Select a Gender"),
//     GenderItem("f", "Female"),
//     GenderItem("m", "Male"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     List<DropdownMenuItem<String?>> genderItems = genders.map((genderValue) {
//       return DropdownMenuItem(
//         value: genderValue.valueofGender,
//         child: Text(genderValue.textToShow),
//       );
//     }).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Registration Screen"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             Text("Name"),
//             TextField(
//               controller: namecontroller,
//               decoration: InputDecoration(
//                 hintText: "Name",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text("Email id"),
//             TextField(
//               controller: emailcontroller,
//               decoration: InputDecoration(
//                 hintText: "Email id",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text("Age"),
//             TextField(
//               controller: agecontroller,
//               keyboardType: TextInputType.number,
//               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//               decoration: InputDecoration(
//                 hintText: "Age",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text("Gender"),
//             DropdownButton<String?>(
//               isExpanded: true,
//               value: selectedValue,
//               icon: Icon(Icons.arrow_drop_down),
//               items: genderItems,
//               onChanged: (String? newValue) {
//                 setState(
//                   () {
//                     selectedValue = newValue;
//                     print(selectedValue);
//                   },
//                 );
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text("Password"),
//             Obx(
//               () => TextField(
//                 controller: passcontroller,
//                 obscureText: registerController.hiddenPass.value,
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                   border: OutlineInputBorder(),
//                   suffix: InkWell(
//                     child: Icon(
//                       registerController.hiddenPass.value
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                       color: registerController.hiddenPass.value
//                           ? Colors.blue
//                           : Colors.grey,
//                     ),
//                     onTap: () {
//                       registerController.hiddenPass.value =
//                           !registerController.hiddenPass.value;
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: ElevatedButton(
//                   onPressed: () async {
//                     AuthenticationResponse authenticationResponse =
//                         await submitData(
//                       namecontroller.text,
//                       emailcontroller.text,
//                       agecontroller.text,
//                       selectedValue,
//                       passcontroller.text,
//                     );
//                     var loginuser = namecontroller.text;
//                     if (authenticationResponse.success) {
//                       Get.toNamed('/dashboard?name=$namecontroller');
//                     }
//                     print(authenticationResponse.success);
//                     print(authenticationResponse.authenticationData?.jwtToken);
//                   },
//                   child: Text("Submit")),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
