import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterPortfolioScreen extends StatefulWidget {
  const FlutterPortfolioScreen({super.key});

  @override
  State<FlutterPortfolioScreen> createState() => _FlutterPortfolioScreenState();
}

class _FlutterPortfolioScreenState extends State<FlutterPortfolioScreen> {
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
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            return _buildDesktopLayout(context);
          } else {
            return _buildMobileLayout(context);
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //HeroSection(),
          Container(
            height: 452,
            color: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 96, horizontal: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () => _launchURL(
                              "https://github.com/Abdul-Hadi-Jalil",
                            ),
                            icon: Icon(FontAwesome.github),
                            tooltip: 'Github',
                            iconSize: 28,
                            color: Colors.black,
                          ),
                          IconButton(
                            onPressed: () => _launchURL(
                              "https://www.linkedin.com/in/abdulhadijalil/",
                            ),
                            icon: Icon(FontAwesome.linkedin),
                            tooltip: 'LinkedIn',
                            iconSize: 28,
                            color: Color(0xFF0077B5), // LinkedIn brand blue
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(radius: 125, child: Image.asset("download.jpg")),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Text('My Project'),
                Row(children: [SearchBar(), SearchBar(), SearchBar()]),
                //GridView(gridDelegate: )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Container();
  }
}
