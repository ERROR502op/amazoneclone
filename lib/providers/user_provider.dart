import 'package:flutter/cupertino.dart';
import 'package:practice/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: "",
      name: "",
      email: "",
      token: "",
      type: "",
      password: "",
      address: "");
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
