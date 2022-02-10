import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownTest extends StatefulWidget {
  const DropDownTest({Key? key}) : super(key: key);

  @override
  _DropDownTestState createState() => _DropDownTestState();
}

class _DropDownTestState extends State<DropDownTest> {
  String? dropdownval = "1";
  @override
  Widget build(BuildContext context) {
    List<int?> numbers = [1, 2, 3, 4];
    List<DropdownMenuItem<String?>> items = numbers.map((valueAtpos) {
      return DropdownMenuItem(
        value: valueAtpos?.toString(),
        child: Text(valueAtpos.toString()),
      );
    }).toList();
    return Scaffold(
      body: Center(
        child: DropdownButton<String?>(
          value: dropdownval,
          items: items,
          onChanged: (newValue) {
            setState(() {
              dropdownval = newValue;
              print(dropdownval);
            });
          },
        ),
      ),
    );
  }
}


//List<DropdownMenuItem<String>> items = [
//   DropdownMenuItem(child: Text("1")),
//  DropdownMenuItem(child: Text("2")),
//   DropdownMenuItem(child: Text("3")),
//    DropdownMenuItem(child: Text("4")),
//]


//     List nums = [1,2,3,4];
// List<DropdownMenuItem<String>> items = [];

// for(int value in nums){
//   items.add(DropdownMenuItem(
//     value:value.toString(),
//     child: Text("$value")
//     ),);
// }

