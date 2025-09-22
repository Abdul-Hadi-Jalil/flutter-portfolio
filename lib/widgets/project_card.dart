import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/tech_stack.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imgPath;
  final String complexity;
  final List<String> techStack;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imgPath,
    required this.complexity,
    required this.techStack,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 368,
      height: 452,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imgPath, height: 192),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                      height: 26,
                      width: 62,
                      decoration: BoxDecoration(
                        color: Color(0xFF139948),
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      child: Center(
                        child: Text(
                          complexity,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19),
                Text(description, style: TextStyle(fontSize: 14)),
                SizedBox(height: 17),
                Row(
                  children: techStack
                      .map((tech) => TechStack(text: tech))
                      .toList(),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 40,
                          width: 111,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color.fromARGB(255, 2, 128, 200),
                          ),
                          child: Center(
                            child: Text(
                              'View Project',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
