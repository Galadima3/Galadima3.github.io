import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_site/sections/shared_widgets/social_icon_button.dart';

class ProjectTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<String> technologies;
  final String? projectUrl;

  const ProjectTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.technologies,
    this.projectUrl
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
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 150.h,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(description, style: theme.textTheme.bodyMedium),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 6.5,
                      runSpacing: 6.5,
                      children: technologies
                          .map(
                            (tech) => Chip(
                              label: Text(tech),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7.5,
                                vertical: 4,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SocialIconButton(
                        icon: FontAwesomeIcons.github,
                        url: projectUrl!,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
