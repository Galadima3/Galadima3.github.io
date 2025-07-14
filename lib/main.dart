import 'package:flutter/material.dart';

import 'package:portfolio_site/widgets/about_section.dart';
import 'package:portfolio_site/widgets/contact_section.dart';
import 'package:portfolio_site/widgets/details_section.dart';
import 'package:portfolio_site/widgets/project_section.dart';
import 'package:portfolio_site/widgets/skill_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: const MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.dark_mode),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              children: [
                
                DetailSection(),
                SizedBox(height: 32),
                AboutMeSection(),
                SizedBox(height: 15),
                ProjectSection(),
                SizedBox(height: 15),
                SkillSection(),
                SizedBox(height: 15),
                ContactSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
