// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:portfolio_site/extensions/extensions.dart';

// class DetailSection extends StatelessWidget {
//   const DetailSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CircleAvatar(radius: 62.5, backgroundColor: Colors.black),
//         // Name
//         Text(
//           "John Galadima",
//           style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),

//         // Job Title
//         Text(
//           "Mobile Developer [Dart & Flutter]",
//           style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(height: 10.5),

//         // ✅ Email and Location - aligned left under centered block
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start, // aligns icon + text
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SvgPicture.asset(
//                   'assets/images/icons/mail.svg',
//                   height: 20,
//                   width: 20,
//                 ),
//                 const SizedBox(width: 8),
//                 const Text("Galadima3@protonmail.com"),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: const [
//                 Icon(Icons.location_pin, size: 20),
//                 SizedBox(width: 8),
//                 Text("Abuja, Nigeria"),
//               ],
//             ),
//           ],
//         ),

//         const SizedBox(height: 16),

//         // Social icons centered
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             "assets/images/icons/github.svg".asSvgAsset(height: 30, width: 30),
//             const SizedBox(width: 15),
//             "assets/images/icons/linkedin.svg".asSvgAsset(
//               height: 30,
//               width: 30,
//             ),
//             const SizedBox(width: 15),
//             "assets/images/icons/twitter.svg".asSvgAsset(height: 30, width: 30),
//           ],
//         ),
//       ],
//     );
//   }
// }

// widgets/details_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_site/extensions/extensions.dart';
import 'package:portfolio_site/responsive.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = Responsive.isTablet(context);

    final nameStyle = isDesktop
        ? textTheme.headlineSmall
        : isTablet
            ? textTheme.titleLarge
            : textTheme.titleMedium;

    final titleStyle = isDesktop
        ? textTheme.bodyLarge
        : isTablet
            ? textTheme.bodyMedium
            : textTheme.bodySmall;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (isDesktop) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.black,
                    ),
                    const SizedBox(height: 16),
                    Text("John Galadima", style: nameStyle?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text("Mobile Developer [Dart & Flutter]", style: titleStyle),
                    const SizedBox(height: 10.5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/icons/mail.svg',
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text("Galadima3@protonmail.com"),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.location_pin, size: 20),
                            SizedBox(width: 8),
                            Text("Abuja, Nigeria"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "assets/images/icons/github.svg".asSvgAsset(height: 30, width: 30),
                        const SizedBox(width: 15),
                        "assets/images/icons/linkedin.svg".asSvgAsset(height: 30, width: 30),
                        const SizedBox(width: 15),
                        "assets/images/icons/twitter.svg".asSvgAsset(height: 30, width: 30),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 48),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Me",
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "I am a passionate mobile developer with a knack for creating user-friendly, efficient, and innovative applications."
                        " Currently, I'm focused on refining my skills and building apps that showcase creativity and functionality."
                        " Whether it's crafting dynamic interfaces or implementing clean, maintainable code, I'm dedicated to delivering excellence in every project.",
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          // fallback for smaller screens
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black,
              ),
              const SizedBox(height: 12),
              Text("John Galadima", style: nameStyle?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text("Mobile Developer [Dart & Flutter]", style: titleStyle),
              const SizedBox(height: 10.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/icons/mail.svg',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text("Galadima3@protonmail.com"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.location_pin, size: 20),
                      SizedBox(width: 8),
                      Text("Abuja, Nigeria"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "assets/images/icons/github.svg".asSvgAsset(height: 30, width: 30),
                  const SizedBox(width: 15),
                  "assets/images/icons/linkedin.svg".asSvgAsset(height: 30, width: 30),
                  const SizedBox(width: 15),
                  "assets/images/icons/twitter.svg".asSvgAsset(height: 30, width: 30),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Me",
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "I am a passionate mobile developer with a knack for creating user-friendly, efficient, and innovative applications."
                      " Currently, I'm focused on refining my skills and building apps that showcase creativity and functionality."
                      " Whether it's crafting dynamic interfaces or implementing clean, maintainable code, I'm dedicated to delivering excellence in every project.",
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
