import 'package:get/get.dart';

class UserController extends GetxController {
  var userName = "".obs;
  void setUserName(name) {
    userName.value = name;
  }
}
