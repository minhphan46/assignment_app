import 'package:assignment_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Users extends GetxController {
  String? id;
  final _users = [
    User(name: "Minh"),
    User(name: "Phong"),
    User(name: "Thang"),
    User(name: "Hung"),
    User(name: "Quan"),
    User(name: "Linh"),
  ].obs;

  List<User> get users {
    return [..._users];
  }

  Users();

  void addUser(User user) {
    _users.add(user);
  }

  void doneGarbage() {
    print(_users.value[0].name);
    User temp = _users[0];
    _users.remove(_users[0]);
    _users.add(temp);
  }
}
