import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';

import '../models/users.dart';

class RandomScreen extends StatefulWidget {
  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  StreamController<int> selected = StreamController<int>();
  int rewards = 0;
  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  final Users _listUsers = Get.put(Users());
  final items = <String>["0", "1", "2", "3", "4"];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FortuneWheel(
              animateFirst: false,
              items: [
                for (var user in _listUsers.users)
                  FortuneItem(child: Text(user.name)),
              ],
              selected: selected.stream,
              onAnimationEnd: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("You just won " +
                        selected.stream.toString() +
                        " Points!"),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selected.add(Fortune.randomInt(0, items.length));
              });
            },
            child: Container(
              height: 40,
              width: 120,
              color: Colors.redAccent,
              child: Center(
                child: Text("SPIN"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
