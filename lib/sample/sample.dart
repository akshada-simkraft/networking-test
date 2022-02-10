import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResponseData {
  bool success;
  Map<String, dynamic>? data;
  ResponseData({required this.success, this.data});
}

// Future<Register> createAlbum(String title) async {
//   final response = await http.post(
//     Uri.parse('http://localhost:8080/registerUsingPOST'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(
//       <String, String>{
//         'title': title,
//       },
//     ),
//   );
//   if (response.statusCode == 200) {
//     return Register.sending_data(jsonDecode(response.body));
//   } else {
//     throw Exception('unable to complete');
//   }
// }

// class Register {
//   String? title;

//   Register({this.title});

//   factory Register.sending_data(Map<String, dynamic> json) {
//     return Register(
//       title: json['title'],
//     );
//   }
// }

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Subit")),
          ],
        ),
      ),
    );
  }
}
