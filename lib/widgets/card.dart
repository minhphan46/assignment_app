import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  String title;
  CardUser({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 100, left: 100, top: 18),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            )),
        decoration: BoxDecoration(
          color: Color(0xff2a6f97),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
