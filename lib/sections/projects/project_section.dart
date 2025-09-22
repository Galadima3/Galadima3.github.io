import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_site/core/utils/responsive.dart';
import 'package:portfolio_site/sections/projects/project_tile.dart';


class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        //final isDesktop = constraints.maxWidth >= 1024;
        final isDesktop = constraints.maxWidth > Responsive.desktopBreakpoint;
        final cardWidth = isDesktop ? 340.0 : 280.0;

        return Column(
          crossAxisAlignment:
              isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Align(
              alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
              child: Text(
                "Projects",
                style: textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 400.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  SizedBox(
                    width: cardWidth,
                    child: ProjectTile(
                      imagePath: 'assets/images/portfolio_logo.jpg',
                      title: 'Portfolio Website',
                      projectUrl: "https://github.com/Galadima3/portfolio_site",
                      description:
                          'Portfolio site made with Flutter Web 💙',
                      technologies: ['Dart', 'Flutter Web', 'Github Hosting'],
                    ),
                  ),
                  SizedBox(width: 15.w),
                  SizedBox(
                    width: cardWidth,
                    child: ProjectTile(
                      imagePath: 'assets/images/labari.jpg',
                      title: 'Labari',
                      projectUrl: "https://github.com/Galadima3/labari",

                      description:
                          'News app built with Flutter showcasing API integration.',
                      technologies: ['Flutter', 'Riverpod', 'API Integration'],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}


