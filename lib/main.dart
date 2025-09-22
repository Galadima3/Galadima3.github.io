import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_site/providers/theme_notifier_provider.dart';
import 'package:portfolio_site/sections/shared_widgets/download_button.dart';
import 'package:portfolio_site/sections/contact/contact_section.dart';
import 'package:portfolio_site/sections/details/details_section.dart';
import 'package:portfolio_site/sections/projects/project_section.dart';
import 'package:portfolio_site/sections/skill/skill_section.dart';

// final themeStateProvider = StateProvider<bool>((ref) => true);

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = ref.watch(themeNotifierProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder:
          (context, child) => MaterialApp(
            title: 'John Galadima - Portfolio',
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
                  //TODO: Swtich to Notifier Provider ✅
                  ref.read(themeNotifierProvider.notifier).toggleTheme();
                  
                },
                icon: Icon(
                  ref.watch(themeNotifierProvider)
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              ),
        ),
        actions: [DownloadButton()],
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
