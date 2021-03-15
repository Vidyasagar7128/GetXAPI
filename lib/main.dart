//import 'dart:convert';

import 'package:demo/services/userservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get.dart';
//import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userService = Get.put(UserService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GetX<UserService>(builder: (controller) {
        if (controller.users == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  //onTap: () {},
                  trailing: IconButton(
                    tooltip: '${controller.users[index].id.toString()}',
                    icon: (Icon(Icons.remove_circle)),
                    onPressed: () {},
                    color: Colors.red,
                  ),
                  title: Text(controller.users[index].title.toString()),
                  subtitle: Text(controller.users[index].id.toString()),
                );
              });
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userService.getProduct();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
