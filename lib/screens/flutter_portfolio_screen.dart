import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/search_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterPortfolioScreen extends StatefulWidget {
  const FlutterPortfolioScreen({super.key});

  @override
  State<FlutterPortfolioScreen> createState() => _FlutterPortfolioScreenState();
}

class _FlutterPortfolioScreenState extends State<FlutterPortfolioScreen> {
  final List<ButtonSegment<String>> typeSegments = <ButtonSegment<String>>[
    ButtonSegment<String>(value: 'Newest', label: Text('Newest')),
    ButtonSegment<String>(value: 'Oldest', label: Text('Oldest')),
  ];
  Set<String> selectedType = {"Newest"};
  final List<ButtonSegment<String>> complexitySegments =
      <ButtonSegment<String>>[
        ButtonSegment<String>(value: "All", label: Text('All')),
        ButtonSegment<String>(value: "Easy", label: Text('Easy')),
        ButtonSegment<String>(value: "Medium", label: Text('Medium')),
        ButtonSegment<String>(value: "Hard", label: Text('Hard')),
      ];
  Set<String> selectedComplexity = {'All'};

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
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              height: 32,
              width: 32,
              'assets/images/logo.svg',
              colorFilter: ColorFilter.mode(Color(0xFF0079BF), BlendMode.srcIn),
            ),
            Text("FlutterFolio", style: TextStyle(color: Color(0xFF0079BF))),
          ],
        ),
        actions: [
          TextButton(onPressed: () {}, child: Text('About')),
          TextButton(onPressed: () {}, child: Text('Projects')),
          SizedBox(width: 720),
        ],
      ),
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
            height: 500,
            color: Color(0xE6F2FAFF),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 55, horizontal: 80),
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
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: Color(0xFF0079BF),
                              ),
                              Text('+92 309-8979308'),
                            ],
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                color: Color(0xFF0079BF),
                              ),
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
                  CircleAvatar(
                    backgroundColor: Color(0xE6F2FAFF),
                    radius: 150,
                    child: ClipOval(
                      child: Image.asset("assets/images/profile.jpg"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // projects section
          // <start>
          Padding(
            padding: EdgeInsets.symmetric(vertical: 94, horizontal: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Projects',
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 50),
                // search bar and filter options
                // <start>
                Row(
                  children: [
                    MySearchBar(),
                    SizedBox(width: 292),
                    Column(
                      spacing: 5,
                      children: [
                        Text(
                          'Filter by Complexity',
                          style: TextStyle(fontSize: 18),
                        ),
                        SegmentedButton<String>(
                          showSelectedIcon: false,
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          segments: complexitySegments,
                          selected: selectedComplexity,
                          onSelectionChanged: (Set<String> newSelection) {
                            setState(() {
                              selectedComplexity = newSelection;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      spacing: 5,
                      children: [
                        Text('Sort by Date', style: TextStyle(fontSize: 18)),
                        SegmentedButton(
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          showSelectedIcon: false,
                          segments: typeSegments,
                          selected: selectedType,
                          onSelectionChanged: (Set<String> newType) {
                            setState(() {
                              selectedType = newType;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                // <end>
                // search bar and filter options
              ],
            ),
          ),
          // <end>
          // projects section
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Container();
  }
}
