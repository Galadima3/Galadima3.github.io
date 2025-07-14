// import 'package:flutter/material.dart';

// class SkillSection extends StatelessWidget {
//   SkillSection({super.key});

//   final List<String> skills = [
//     "Dart",
//     "Flutter",
//     "MVVM",
//     "Riverpod",
//     "Clean Architecture",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start, // 👈 Align to the left
//         children: [
//           Text(
//             "Skills",
//             style: textTheme.headlineLarge?.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 15),
//           Align(
//             alignment: Alignment.centerLeft, // 👈 Ensure chips wrap left
//             child: Wrap(
//               spacing: 6.5,
//               runSpacing: 6.5,
//               children:
//                   skills.map((skill) {
//                     return Chip(
//                       label: Text(skill),
//                       backgroundColor: Colors.grey.shade200,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 4,
//                       ),
//                     );
//                   }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

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
        final headlineStyle = isDesktop
            ? textTheme.headlineLarge
            : constraints.maxWidth >= 600
                ? textTheme.headlineMedium
                : textTheme.headlineSmall;

        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment:
                isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Align(
                alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
                child: Text(
                  "Skills",
                  style: headlineStyle?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
                child: Wrap(
                  spacing: 6.5,
                  runSpacing: 6.5,
                  children: skills
                      .map((skill) => Chip(
                            label: Text(skill),
                            backgroundColor: Colors.grey.shade200,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          ))
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