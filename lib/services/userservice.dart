import 'package:demo/clients/apicall.dart';
import 'package:demo/models/user.dart';
import 'package:get/get.dart';

class UserService extends GetxController {
  var users = <User>[].obs;
  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  getProduct() async {
    List<User> user = await ApiCall.getData();
    users.assignAll(user);
  }

  postProduct(name, myclass, email, mobile, password) async {
    await ApiCall.postData(
        name.text, myclass.text, email.text, mobile.text, password.text);
  }

  deleteProduct(id) async {
    await ApiCall.deleteData(id);
    print('Id is $id');
  }
}
