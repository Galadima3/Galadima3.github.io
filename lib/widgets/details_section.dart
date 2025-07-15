// widgets/details_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_site/core/constants/details.dart';
import 'package:portfolio_site/core/utils/responsive.dart';
import 'package:portfolio_site/widgets/social_icon_button.dart';

class DetailSection extends ConsumerWidget {
  const DetailSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = Responsive.isTablet(context);

    final nameStyle =
        isDesktop
            ? textTheme.headlineSmall
            : isTablet
            ? textTheme.titleLarge
            : textTheme.titleMedium;

    final titleStyle =
        isDesktop
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
                    SizedBox(height: 16.h),
                    Text(
                      "${Details.name},",
                      style: nameStyle?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6.h),
                    Text(Details.jobTitle, style: titleStyle),
                    SizedBox(height: 10.5.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email, size: 20),

                            SizedBox(width: 8.w),
                            Text(Details.email),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_pin, size: 20),
                            SizedBox(width: 8.w),
                            Text(Details.location),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    SocialIconRow(),
                  ],
                ),
              ),
              SizedBox(width: 48.w),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : Color(0xFF39FF14),
                    ),
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
                      SizedBox(height: 12.h),
                      Text(
                        Details.about,
                        style: textTheme.bodyMedium?.copyWith(fontSize: 15),
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
              const CircleAvatar(radius: 60, backgroundColor: Colors.black),
              SizedBox(height: 12.r),
              Text(
                Details.name,
                style: nameStyle?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6.h),
              Text(Details.jobTitle, style: titleStyle),
              SizedBox(height: 10.5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/mail.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(Details.email),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_pin, size: 20),
                      SizedBox(width: 8.w),
                      Text(Details.location),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SocialIconRow(),
              SizedBox(height: 24.h),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Color(0xFF39FF14),
                  ),
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
                    SizedBox(height: 12.h),
                    Text(Details.about, style: textTheme.bodySmall),
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

class SocialIconRow extends StatelessWidget {
  const SocialIconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIconButton(
          icon: FontAwesomeIcons.github,
          url: 'https://github.com/Galadima3',
        ),
        SizedBox(width: 10),
        SocialIconButton(
          icon: FontAwesomeIcons.linkedin,
          url: 'https://www.linkedin.com/in/john-abraham-galadima/',
        ),
        SizedBox(width: 10),
        SocialIconButton(
          icon: FontAwesomeIcons.twitter,
          url: 'https://x.com/Galadima3x',
        ),
      ],
    );
  }
}
