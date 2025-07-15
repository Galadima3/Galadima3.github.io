import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillSection extends StatelessWidget {
  SkillSection({super.key});

  final List<String> skills = [
    "Dart",
    "Flutter",
    "MVVM",
    "Riverpod",
    "Clean Architecture",
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;
        final headlineStyle =
            isDesktop
                ? textTheme.headlineLarge
                : constraints.maxWidth >= 600
                ? textTheme.headlineMedium
                : textTheme.headlineSmall;

        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment:
                isDesktop
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
            children: [
              Align(
                alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
                child: Text(
                  "Skills",
                  style: headlineStyle?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      skills
                          .map(
                            (skill) => Chip(
                              label: Text(skill),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ), // Adjust as needed
                                side: BorderSide(
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
