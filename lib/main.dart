import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:portfolio_site/widgets/contact_section.dart';
import 'package:portfolio_site/widgets/details_section.dart';
import 'package:portfolio_site/widgets/project_section.dart';
import 'package:portfolio_site/widgets/skill_section.dart';

//TODO: Add Button to download CV


final themeStateProvider = StateProvider<bool>((ref) => true);

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = ref.watch(themeStateProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder:
          (context, child) => MaterialApp(
            title: 'Portfolio',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
              fontFamily: 'Montserrat',
            ),
            home: const MyHomePage(),
          ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer(
          builder:
              (context, ref, child) => IconButton(
                onPressed: () {
                  final current = ref.read(themeStateProvider);
                  ref.read(themeStateProvider.notifier).state = !current;
                },
                icon: Icon(
                  ref.watch(themeStateProvider)
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              children: [
                DetailSection(),
                SizedBox(height: 32.h),
                ProjectSection(),
                SizedBox(height: 15.h),
                SkillSection(),
                SizedBox(height: 15.h),
                ContactSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
