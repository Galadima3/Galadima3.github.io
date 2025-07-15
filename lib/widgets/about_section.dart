import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;
        final headlineStyle = isDesktop
            ? textTheme.headlineLarge
            : constraints.maxWidth >= 600
                ? textTheme.headlineMedium
                : textTheme.headlineSmall;

        final bodyStyle = isDesktop
            ? textTheme.bodyLarge
            : constraints.maxWidth >= 600
                ? textTheme.bodyMedium
                : textTheme.bodySmall;

        return Column(
          crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Align(
              alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
              child: Text(
                "About Me",
                style: headlineStyle?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "I am a passionate mobile developer with a knack for creating user-friendly, efficient, and innovative applications. "
              "Currently, I'm focused on refining my skills and building apps that showcase creativity and functionality. "
              "Whether it's crafting dynamic interfaces or implementing clean, maintainable code, I'm dedicated to delivering excellence in every project.",
              textAlign: isDesktop ? TextAlign.left : TextAlign.center,
              style: bodyStyle,
            ),
          ],
        );
      },
    );
  }
}