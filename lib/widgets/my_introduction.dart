import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class MyIntroduction extends StatelessWidget {
  const MyIntroduction({super.key});

  _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "Could not launch $uri";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 19,
      children: [
        Text(
          'Hi, I am Abdul Hadi Jalil',
          style: TextStyle(
            fontSize: 48,
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 510,
          child: Text(
            'A passionate Flutter developer with 1+ years of experience crafting intuitive and high-performance mobile and web applications. Specializing in cross-platform development, I build engaging user experiences and robust backends.',
            maxLines: 4,
            softWrap: true,
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8,
              children: [
                Icon(Icons.email_outlined, color: Color(0xFF0079BF)),
                Text('+92 309-8979308'),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                Icon(Icons.phone_outlined, color: Color(0xFF0079BF)),
                Text('abdulhadijalil34@gmail.com'),
              ],
            ),
          ],
        ),
        SizedBox(height: 2),
        Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () =>
                  _launchURL("https://github.com/Abdul-Hadi-Jalil"),
              icon: Icon(FontAwesome.github),
              tooltip: 'Github',
              iconSize: 28,
              color: Colors.black,
            ),
            IconButton(
              onPressed: () =>
                  _launchURL("https://www.linkedin.com/in/abdulhadijalil/"),
              icon: Icon(FontAwesome.linkedin),
              tooltip: 'LinkedIn',
              iconSize: 28,
              color: Color(0xFF0077B5), // LinkedIn brand blue
            ),
          ],
        ),
      ],
    );
  }
}
