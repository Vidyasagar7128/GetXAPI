import 'package:demo/models/user.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  static Future<List<User>> getData() async {
    var res =
        await http.get(Uri.https('jsonplaceholder.typicode.com', '/posts'));
    // var data = jsonDecode(res.body);
    // var data = jsonDecode(res.body);
    // print(data.length);
    var data = res.body;
    return userFromJson(data);

    //return data;
  }
}
