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
}
