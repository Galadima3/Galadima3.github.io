import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_site/core/utils/responsive.dart';
import 'package:web/web.dart' as web;
import 'package:portfolio_site/widgets/contact_section.dart';
import 'package:portfolio_site/widgets/details_section.dart';
import 'package:portfolio_site/widgets/project_section.dart';
import 'package:portfolio_site/widgets/skill_section.dart';


//TODO: Configure text font size on mobile
//TODO: Add Image

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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                final anchor =
                    web.document.createElement('a') as web.HTMLAnchorElement;
                anchor.href = 'assets/John Galadima_CV.pdf';
                anchor.download = 'John Galadima_CV.pdf';
                anchor.click();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white70
                            : Colors.black87,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.download),
                    SizedBox(width: 8),
                    Text(
                      Responsive.isMobile(context) ? "CV" : "Download CV",
                      //style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
