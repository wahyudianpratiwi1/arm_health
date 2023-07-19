import 'package:get/get.dart';

import '../model/user_model.dart';

class UserController {
  // mengambil data user dari model
  final _data = User().obs;
  User get data => _data.value;
  setData(User n) => _data.value = n;
}
