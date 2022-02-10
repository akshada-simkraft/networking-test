import 'package:flutter/material.dart';

class SampleImage extends StatelessWidget {
  const SampleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
      child: Center(
          //     child: CircleAvatar(
          //   radius: 200,
          //   backgroundImage: AssetImage('images/cat.jpg'),
          // ),
          // ClipOval(
          //   child: Image.asset(
          //     'images/cat.jpg',
          //     width: 250,
          //     height: 250,
          //   ),
          // ),
          child: ListView(children: [
        CircleAvatar(
          radius: 120,
          backgroundImage: AssetImage('images/srlogo.jpg'),
        ),
      ])),
    ));
  }
}


// Padding(
//         padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
//         child: ListView(
//           children: [
//             const CircleAvatar(
//               radius: 100,
//               backgroundImage: AssetImage('images/srlogo.jpg'),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             const Center(
//               child: Text(
//                 "Marketing Text/Tag Line",
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             const Center(
//               child: Text(
//                 'Sign Up to Get Started',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 30, bottom: 5),
//               child: SizedBox(
//                 height: 50,
//                 child: OutlinedButton(
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Colors.black),
//                   ),
//                   onPressed: () {},
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         'images/google.jpg',
//                         width: 70,
//                       ),
//                       const SizedBox(
//                         width: 40,
//                       ),
//                       const Expanded(
//                         child: Text(
//                           'Continue With Google',
//                           style: TextStyle(color: Colors.black, fontSize: 20),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const Center(
//               child: Text(
//                 'Already have an account? Sign in',
//                 style: TextStyle(
//                     decoration: TextDecoration.underline,
//                     fontStyle: FontStyle.italic),
//               ),
//             ),
//             const SizedBox(
//               height: 60,
//             ),
//             Row(
//               children: [
//                 Checkbox(
//                   side: const BorderSide(color: Colors.black),
//                   checkColor: Colors.black,
//                   value: isChecked,
//                   onChanged: (value) {},
//                   activeColor: Colors.white,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text("By signing up you accept the"),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         GestureDetector(
//                           child: const Text(
//                             'Terms of service',
//                             style: TextStyle(
//                                 color: Colors.blue,
//                                 decoration: TextDecoration.underline),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         const Text('&'),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     GestureDetector(
//                       child: const Text(
//                         'Privacy Policy',
//                         style: TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
