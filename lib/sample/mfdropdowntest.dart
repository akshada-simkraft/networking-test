import 'package:flutter/material.dart';

class GenderItem {
  String? valueofGender;
  String textToShow;
  GenderItem(this.valueofGender, this.textToShow);
}

class DropDownListTest extends StatefulWidget {
  const DropDownListTest({Key? key}) : super(key: key);

  @override
  _DropDownListTestState createState() => _DropDownListTestState();
}

class _DropDownListTestState extends State<DropDownListTest> {
  String? selectedValue;

  List<GenderItem> genders = [
    GenderItem(null, "Select Gender"),
    GenderItem('m', "Male"),
    GenderItem('f', "Female"),
  ];

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String?>> listofGenders = genders.map(
      (genderValue) {
        return DropdownMenuItem<String?>(
          value: genderValue.valueofGender,
          child: Text(genderValue.textToShow),
        );
      },
    ).toList();
    return Scaffold(
      body: Center(
        child: DropdownButton<String?>(
          value: selectedValue,
          items: listofGenders,
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
              print(selectedValue);
            });
          },
        ),
      ),
    );
  }
}
