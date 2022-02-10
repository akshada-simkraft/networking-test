import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoItem {
  String titletext;
  ToDoItem({required this.titletext});
}

List<ToDoItem> listOfItems = [
  ToDoItem(titletext: "Item 1"),
  ToDoItem(titletext: "Item 2"),
  ToDoItem(titletext: "Item 3"),
  ToDoItem(titletext: "Item 4"),
];
