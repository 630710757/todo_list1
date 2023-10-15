import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_list1/models/todo_item.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dio = Dio();

  void getTodos() async {
    final response =
    await _dio.get('https://jsonplaceholder.typicode.com/todos');
    debugPrint(response.data.toString());
    //parse
    List list = jsonDecode(response.data.toString());
    List<TodoItem> itemList =
    list.map((item) => TodoItem.fromJson(item)).toList();
    for(var elm in itemList) {
      debugPrint(elm.title);
    }
  }


  @override
  void initState() {
    super.initState();
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
