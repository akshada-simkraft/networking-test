import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networking_project/data/listmodel.dart';

Future<UserProfile> fetchdata(String jwtToken) async {
  final profiledata = await http.get(
      Uri.parse('http://localhost:8080/api/user'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $jwtToken'});
  final profileresponse = jsonDecode(profiledata.body);
  print(profileresponse);

  return UserProfile.fromJson(profileresponse);
}

class UserProfile {
  String name;
  int age;
  String gender;
  String email;
  UserProfile(
      {required this.name,
      required this.age,
      required this.gender,
      required this.email});
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
    );
  }
}

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late Future<UserProfile> userprofile;
  final GetStorage storage = GetStorage();

  @override
  void initState() {
    super.initState();
    userprofile = fetchdata(storage.read('jwtToken'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DashBoard"),
        actions: [
          IconButton(
            onPressed: () {
              TextEditingController addcontroller = TextEditingController();
              Get.defaultDialog(
                content: TextField(controller: addcontroller),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          listOfItems
                              .add(ToDoItem(titletext: addcontroller.text));
                          Get.back();
                        },
                      );
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: FutureBuilder<UserProfile>(
                future: userprofile,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: [
                        Text(snapshot.data!.name),
                        Text(snapshot.data!.email),
                      ],
                      
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed('/profiledetails');
              },
              title: const Text("Profile"),
            ),
            ListTile(
              onTap: () {},
              title: const Text("Change Password"),
            ),
            ListTile(
              onTap: () {
                Get.offAllNamed('/');
              },
              title: const Text("Logout"),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: listOfItems.length,
        itemBuilder: (context, index) {
          var todos = listOfItems[index];
          var textValue = todos.titletext;
          return ListTile(
            title: Text(textValue),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            TextEditingController dialogcontroller =
                                TextEditingController(text: textValue);
                            Get.defaultDialog(
                              content: TextField(controller: dialogcontroller),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                    setState(
                                      () {
                                        todos.titletext = dialogcontroller.text;
                                      },
                                    );
                                    Get.back();
                                  },
                                  child: const Text("UpdateItem"),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("Cancel"),
                                ),
                              ],
                            );
                          },
                          child: const Text("Show Dialog"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            Future? resultfromnext =
                                Get.toNamed('/update?textValue=$textValue');
                            resultfromnext?.then(
                              (value) {
                                String? result = value as String?;
                                if (result != null) {
                                  Get.back();
                                  setState(
                                    () {
                                      todos.titletext = result;
                                    },
                                  );
                                }
                              },
                            ); //Get.toNamed('/update', arguments: [textValue]);
                          },
                          child: const Text("Show Screen"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Cancel"),
                        ),
                      ],
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Are you sure",
                      confirm: ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              listOfItems.removeAt(index);
                              Get.back();
                            },
                          );
                        },
                        child: const Text("sure"),
                      ),
                      cancel: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Cancel"),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}









// Future<UserProfile> fetchdata() async {
//   var tokenToAccept = Get.arguments;
//   final profiledata = await http.get(
//       Uri.parse('http://localhost:8080/api/user'),
//       headers: {HttpHeaders.authorizationHeader: 'Bearer $tokenToAccept'});
//   final profileresponse = jsonDecode(profiledata.body);
//   print(profileresponse);
//   return UserProfile.fromJson(profileresponse);
// }

// class UserProfile {
//   String name;
//   int age;
//   String gender;
//   String email;
//   UserProfile(
//       {required this.name,
//       required this.age,
//       required this.gender,
//       required this.email});
//   factory UserProfile.fromJson(Map<String, dynamic> json) {
//     return UserProfile(
//         name: json['name'],
//         age: json['age'],
//         gender: json['gender'],
//         email: json['email']);
//   }
// }
// class DashBoard extends StatefulWidget {
//   const DashBoard({Key? key}) : super(key: key);

//   @override
//   State<DashBoard> createState() => _DashBoardState();
// }

// class _DashBoardState extends State<DashBoard> {
//   late Future<UserProfile> userprofile;

//   @override
//   void initState() {
//     super.initState();
//     userprofile = fetchdata();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print(logintokenToAccept);
//     // fetchdata();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("DashBoard"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               TextEditingController addcontroller = TextEditingController();
//               Get.defaultDialog(
//                 content: TextField(controller: addcontroller),
//                 actions: [
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(
//                         () {
//                           listOfItems
//                               .add(ToDoItem(titletext: addcontroller.text));
//                           Get.back();
//                         },
//                       );
//                     },
//                     child: Text("Add"),
//                   ),
//                 ],
//               );
//             },
//             icon: Icon(Icons.add),
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(color: Colors.blue),
//               child: FutureBuilder<UserProfile>(
//                 future: userprofile,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView(
//                       children: [
//                         Text(snapshot.data!.name),
//                         Text(snapshot.data!.email),
//                       ],
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }
//                   return CircularProgressIndicator();
//                 },
//               ),
//               //Text("headers"),
//               //Text('${Get.parameters['pass']}'),
//             ),
//             ListTile(
//               onTap: () {
//                 Get.toNamed('/profiledetails');
//               },
//               title: Text("Profile"),
//             ),
//             ListTile(
//               onTap: () {},
//               title: Text("Change Password"),
//             ),
//             ListTile(
//               onTap: () {
//                 Get.offAllNamed('/');
//               },
//               title: Text("Logout"),
//             ),
//           ],
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: listOfItems.length,
//         itemBuilder: (context, index) {
//           var todos = listOfItems[index];
//           var textValue = todos.titletext;
//           return ListTile(
//             title: Text(textValue),
//             trailing: Wrap(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     Get.defaultDialog(
//                       actions: [
//                         ElevatedButton(
//                           onPressed: () {
//                             TextEditingController dialogcontroller =
//                                 TextEditingController(text: textValue);
//                             Get.defaultDialog(
//                               content: TextField(controller: dialogcontroller),
//                               actions: [
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Get.back();
//                                     setState(
//                                       () {
//                                         todos.titletext = dialogcontroller.text;
//                                       },
//                                     );
//                                     Get.back();
//                                   },
//                                   child: Text("UpdateItem"),
//                                 ),
//                                 const SizedBox(
//                                   width: 30,
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Get.back();
//                                   },
//                                   child: Text("Cancel"),
//                                 ),
//                               ],
//                             );
//                           },
//                           child: Text("Show Dialog"),
//                         ),
//                         ElevatedButton(
//                           onPressed: () async {
//                             Future? resultfromnext =
//                                 Get.toNamed('/update?textValue=$textValue');
//                             resultfromnext?.then(
//                               (value) {
//                                 String? result = value as String?;
//                                 if (result != null) {
//                                   Get.back();
//                                   setState(
//                                     () {
//                                       todos.titletext = result;
//                                     },
//                                   );
//                                 }
//                               },
//                             ); //Get.toNamed('/update', arguments: [textValue]);
//                           },
//                           child: Text("Show Screen"),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           child: Text("Cancel"),
//                         ),
//                       ],
//                     );
//                   },
//                   icon: Icon(Icons.edit),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     Get.defaultDialog(
//                       title: "Are you sure",
//                       confirm: ElevatedButton(
//                         onPressed: () {
//                           setState(
//                             () {
//                               listOfItems.removeAt(index);
//                               Get.back();
//                             },
//                           );
//                         },
//                         child: Text("sure"),
//                       ),
//                       cancel: ElevatedButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         child: Text("Cancel"),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

