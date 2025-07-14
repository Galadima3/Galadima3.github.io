// import 'package:flutter/material.dart';
// import 'package:portfolio_site/extensions/extensions.dart';

// class ContactSection extends StatelessWidget {
//   const ContactSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return Container(
//       width: double.infinity,
//       //height: 300,
//       // color: const Color(0xFF121212),
//       // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
//       child: Column(
//         //mainAxisSize: MainAxisSize.min,
//         children: [
//           // Title
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               "Contact Me",
//               style: theme.headlineLarge?.copyWith(
//                 fontWeight: FontWeight.bold,
                
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),

//           // Description
//           Text(
//             "I am always open to discussing new projects, creative ideas, "
//             "or opportunities to be part of your vision. Let's connect and "
//             "explore how we can work together!",
//             textAlign: TextAlign.center,
//             style: theme.bodyLarge?.copyWith(),
//           ),
//           const SizedBox(height: 24),

//           // Call to action button
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue.shade800,
//               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             onPressed: () {
//               // Open contact form or email link
//             },
//             child: const Text(
//               "Get in Touch",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(height: 48),

//           const Divider(color: Colors.white24, thickness: 0.5),
//           const SizedBox(height: 16),

//           // Footer text
//           Text(
//             "© 2025 John Galadima. All rights reserved.",
//             style: theme.bodyMedium?.copyWith(),
//           ),
//           const SizedBox(height: 16),

//           // Social icons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               "assets/images/icons/github.svg".asSvgAsset(
//                 height: 24,
//                 width: 24,
//               ),

//               const SizedBox(width: 20),
//               "assets/images/icons/linkedin.svg".asSvgAsset(
//                 height: 30,
//                 width: 30,
//               ),

//               const SizedBox(width: 20),
//               "assets/images/icons/twitter.svg".asSvgAsset(
//                 height: 30,
//                 width: 30,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:portfolio_site/extensions/extensions.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;
        final headlineStyle = isDesktop
            ? theme.headlineLarge
            : constraints.maxWidth >= 600
                ? theme.headlineMedium
                : theme.headlineSmall;

        final bodyStyle = isDesktop
            ? theme.bodyLarge
            : constraints.maxWidth >= 600
                ? theme.bodyMedium
                : theme.bodySmall;

        return Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment:
                isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Align(
                alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
                child: Text(
                  "Contact Me",
                  style: headlineStyle?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "I am always open to discussing new projects, creative ideas, "
                "or opportunities to be part of your vision. Let's connect and "
                "explore how we can work together!",
                textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                style: bodyStyle,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  // Implement contact action
                },
                child: const Text(
                  "Get in Touch",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              const Divider(color: Colors.black26, thickness: 0.5),
              const SizedBox(height: 16),
              Text("© 2025 John Galadima. All rights reserved.", style: theme.bodyMedium),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "assets/images/icons/github.svg".asSvgAsset(height: 24, width: 24),
                  const SizedBox(width: 20),
                  "assets/images/icons/linkedin.svg".asSvgAsset(height: 30, width: 30),
                  const SizedBox(width: 20),
                  "assets/images/icons/twitter.svg".asSvgAsset(height: 30, width: 30),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}