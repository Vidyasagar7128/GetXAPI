import 'package:demo/services/userservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(CreateUser());
}

class CreateUser extends StatelessWidget {
  final userService = Get.put(UserService());
  final _formkey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController myclass = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: myclass,
                  decoration: InputDecoration(
                    labelText: 'Class',
                  ),
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: mobile,
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                  ),
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 20.0),
                IconButton(
                  splashColor: Colors.green[600],
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      _formkey.currentState.save();
                      print(email.text);
                      userService.postProduct(
                          name, myclass, email, mobile, password);
                      Get.back();
                    }
                  },
                  icon: Icon(
                    Icons.add,
                    size: 20.0,
                  ),
                  splashRadius: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
