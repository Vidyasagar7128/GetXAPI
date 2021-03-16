import 'package:demo/models/user.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  ///////////Show Data//////////////
  static Future<List<User>> getData() async {
    var res = await http.get(Uri.http('localhost:3000', '/'));
    var data = res.body;
    return userFromJson(data);
  }

  //////////////Insert Data///////////////////
  /////localhost:3000 http://localhost:3000/
  static postData(name, myclass, email, mobile, password) async {
    print(password);
    var res = await http.post(Uri.http('localhost:3000', '/'), body: {
      'name': name,
      'class': myclass,
      'email': email,
      'mobile': mobile,
      'password': password
    });
    print(res.body);
  }

///////////////Delete Data/////////////////////
  static deleteData(id) async {
    var res = await http.delete(Uri.http('localhost:3000', '/user/$id'));
    print('from API ' + res.body);
  }
}
