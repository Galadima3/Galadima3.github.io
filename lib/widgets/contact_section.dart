import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_site/core/constants/details.dart';

import 'package:portfolio_site/widgets/social_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;
        final headlineStyle =
            isDesktop
                ? theme.headlineLarge
                : constraints.maxWidth >= 600
                ? theme.headlineMedium
                : theme.headlineSmall;

        final bodyStyle =
            isDesktop
                ? theme.bodyLarge
                : constraints.maxWidth >= 600
                ? theme.bodyMedium
                : theme.bodySmall;

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
                  "Contact Me",
                  style: headlineStyle?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                Details.reachOut,
                textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                style: bodyStyle,
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                
                  onPressed: () async {
                    final Uri uri = Uri(
                      scheme: 'mailto',
                      path: Details.email,
                      query: 'subject=Let\'s connect&body=Hi John,',
                    );
                
                    try {
                      await launchUrl(
                        uri,
                        mode:
                            LaunchMode
                                .platformDefault, // Critical for web/mobile support
                      );
                    } catch (e) {
                      debugPrint('Could not launch email client: $e');
                    }
                  },
                
                  child: const Text(
                    "Get in Touch",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48.h),
              const Divider(color: Colors.black26, thickness: 0.5),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "© 2025 John Galadima. All rights reserved.",
                  style: theme.bodyMedium,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIconButton(
                    icon: FontAwesomeIcons.github,
                    url: 'https://github.com/Galadima3',
                  ),
                  SizedBox(width: 10.w),
                  SocialIconButton(
                    icon: FontAwesomeIcons.linkedin,
                    url: 'https://www.linkedin.com/in/john-abraham-galadima/',
                  ),
                  SizedBox(width: 10.w),
                  SocialIconButton(
                    icon: FontAwesomeIcons.twitter,
                    url: 'https://x.com/Galadima3x',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
