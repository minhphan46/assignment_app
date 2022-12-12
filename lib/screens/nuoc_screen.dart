import 'package:assignment_app/models/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/card.dart';

class NuocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users _listUsers = Get.put(Users());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff2a6f97),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Image.asset("assets/gallon.png"),
                ),
                SizedBox(width: 20),
                const Text(
                  "LẤY NƯỚC",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.subdirectory_arrow_right_rounded,
                  size: 30,
                  color: Color(0xff013a63),
                ),
                Container(
                  height: 95,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xff013a63),
                      width: 3,
                    ),
                  ),
                ),
                Icon(
                  Icons.subdirectory_arrow_left_rounded,
                  size: 30,
                  color: Color(0xff013a63),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Obx(
                () => ListView.builder(
                  itemCount: _listUsers.users.length,
                  itemBuilder: (context, i) {
                    return CardUser(title: _listUsers.users[i].name);
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Color(0xff2a6f97),
                radius: 30,
                child: IconButton(
                  onPressed: _listUsers.doneGarbage,
                  icon: const Icon(
                    Icons.done,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
