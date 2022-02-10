import 'package:flutter/material.dart';

class Human {
  String? name;
  int? age;

  Human({this.name, this.age});

  factory Human.createnew(Map<String, dynamic> value) {
    return Human(
      name: value['name'],
      age: value['age'],
    );
  }
}

main() {
  var map = {
    'name': "akshada",
    'age': 21,
  };
  Human h = Human.createnew(map);
  print("${h.name} : ${h.age}");
}
