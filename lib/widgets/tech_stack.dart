import 'package:flutter/material.dart';

class TechStack extends StatelessWidget {
  final String text;

  const TechStack({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999),
          color: Color.fromARGB(248, 225, 226, 231),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
