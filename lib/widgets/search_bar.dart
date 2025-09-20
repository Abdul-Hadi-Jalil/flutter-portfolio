import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 384,
      height: 40,
      child: SearchBar(
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 12)),
        side: WidgetStateProperty.all(BorderSide(color: Color(0xFFDEE1E6))),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
        elevation: WidgetStateProperty.all(0),
        shadowColor: WidgetStateProperty.all(Colors.white),
        backgroundColor: WidgetStateProperty.all(Colors.blue[50]),
        leading: Icon(Icons.search),
        hintText: "Search projects",
      ),
    );
  }
}
