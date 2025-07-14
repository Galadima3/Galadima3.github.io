// import 'package:flutter/material.dart';

// class ProjectSection extends StatelessWidget {
//   const ProjectSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             "Projects",
//             style: textTheme.headlineLarge?.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(height: 15),
//         SizedBox(
//           height: 400, // enough to fit the full ProjectTile
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             children: [
//               SizedBox(
//                 width: 300,
//                 child: ProjectTile(
//                   imagePath: 'assets/images/project1.png',
//                   title: 'Flutter Portfolio Website',
//                   description:
//                       'A modern portfolio built with Flutter Web showcasing projects and skills.',
//                   technologies: ['Flutter', 'Dart', 'Firebase', 'Riverpod'],
//                 ),
//               ),
//               const SizedBox(width: 16),
//               SizedBox(
//                 width: 300,
//                 child: ProjectTile(
//                   imagePath: 'assets/images/project2.png',
//                   title: 'Flutter News Website',
//                   description:
//                       'A modern news app built with Flutter showcasing API integration.',
//                   technologies: ['Flutter', 'Dart', 'Firebase', 'Riverpod'],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }




// class ProjectTile extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String description;
//   final List<String> technologies;

//   const ProjectTile({
//     super.key,
//     required this.imagePath,
//     required this.title,
//     required this.description,
//     required this.technologies,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       clipBehavior: Clip.antiAlias,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Project Image
//           Image.asset(
//             imagePath,
//             width: double.infinity,
//             height: 150,
//             fit: BoxFit.cover,
//           ),

//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Title
//                 Text(
//                   title,
//                   style: theme.textTheme.titleLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),

//                 // Description
//                 Text(description, style: theme.textTheme.bodyMedium),
//                 const SizedBox(height: 10),

//                 // Tech Chips
//                 Wrap(
//                   spacing: 6.5,
//                   runSpacing: 6.5,
//                   children:
//                       technologies
//                           .map(
//                             (tech) => Chip(
//                               label: Text(tech),
//                               backgroundColor: Colors.grey.shade200,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 7.5,
//                                 vertical: 4,
//                               ),
//                             ),
//                           )
//                           .toList(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;
        final cardWidth = isDesktop ? 340.0 : 280.0;

        return Column(
          crossAxisAlignment:
              isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Align(
              alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
              child: Text(
                "Projects",
                style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  SizedBox(
                    width: cardWidth,
                    child: ProjectTile(
                      imagePath: 'assets/images/project1.png',
                      title: 'Flutter Portfolio Website',
                      description:
                          'A modern portfolio built with Flutter Web showcasing projects and skills.',
                      technologies: ['Flutter', 'Dart', 'Firebase', 'Riverpod'],
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: cardWidth,
                    child: ProjectTile(
                      imagePath: 'assets/images/project2.png',
                      title: 'Flutter News Website',
                      description:
                          'A modern news app built with Flutter showcasing API integration.',
                      technologies: ['Flutter', 'Dart', 'Firebase', 'Riverpod'],
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

class ProjectTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<String> technologies;

  const ProjectTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, width: double.infinity, height: 150, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(description, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6.5,
                  runSpacing: 6.5,
                  children: technologies
                      .map((tech) => Chip(
                            label: Text(tech),
                            backgroundColor: Colors.grey.shade200,
                            padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 4),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
