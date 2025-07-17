// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio_site/core/utils/responsive.dart';
import 'package:portfolio_site/helpers/download_helper.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? Colors.white70 : Colors.black87;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => triggerDownload('assets/John Galadima_CV.pdf', 'John Galadima_CV.pdf'),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.hovered)) {
            return isDark
                ? Colors.white.withOpacity(0.1)
                : Colors.black.withOpacity(0.05);
          }
          return null;
        }),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.download),
              const SizedBox(width: 8),
              Text(
                Responsive.isMobile(context) ? "CV" : "Download CV",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
