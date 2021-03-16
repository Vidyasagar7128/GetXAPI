//import 'dart:convert';

import 'package:demo/services/userservice.dart';
import 'package:demo/views/creareuser.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green[600],
      ),
      home: MyHomePage(title: 'List of Users'),
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
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Balaji Sonfule'),
              accountEmail: Text("balajisonfule07@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "B",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
          ],
        ),
      ),
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
                  dense: true,
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.green[600],
                  ),
                  //onTap: () {},
                  trailing: IconButton(
                    splashRadius: 25.0,
                    tooltip: '${controller.users[index].mobile.toString()}',
                    icon: (Icon(Icons.remove_circle)),
                    onPressed: () {
                      Get.snackbar(
                        "Deleted Succesfully",
                        "Undo",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.black87,
                        colorText: Colors.white,
                      );
                      userService.deleteProduct(controller.users[index].id);
                      userService.getProduct();
                    },
                    color: Colors.red,
                  ),
                  title: Text(controller.users[index].name.toString()),
                  subtitle: Text(controller.users[index].id.toString()),
                );
              });
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateUser());
        },
        tooltip: 'Add User',
        child: Icon(Icons.add),
      ),
    );
  }
}
