import 'package:assignment_app/models/user.dart';
import 'package:assignment_app/models/users.dart';
import 'package:assignment_app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users _listUsers = Get.put(Users());

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
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
      ),
    );
  }
}
