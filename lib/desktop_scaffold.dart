import 'package:flutter/material.dart';
import 'package:portfolio_site/widgets/about_section.dart';
import 'package:portfolio_site/widgets/details_section.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.dark_mode),
        ),
      ),
      body: SafeArea(child: Column(
        children: [
          // Detail Section -> About Section
          ResponsiveTopSection(),


        ],
      )),
    );
  }
}


class ResponsiveTopSection extends StatelessWidget {
  const ResponsiveTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 904;
    final isTablet = screenWidth >= 904 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;

    final mainAxis = isMobile ? Axis.vertical : Axis.horizontal;
    final spacing = isMobile ? 24.0 : 32.0;
    final padding = isMobile
        ? const EdgeInsets.all(16)
        : const EdgeInsets.symmetric(horizontal: 32, vertical: 24);
    final maxWidth = isDesktop ? 1200.0 : double.infinity;

    return Center(
      child: Padding(
        padding: padding,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Flex(
            direction: mainAxis,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1,
                child: const DetailSection(),
              ),
              SizedBox(width: isMobile ? 0 : spacing, height: isMobile ? spacing : 0),
              Expanded(
                flex: isMobile ? 0 : 2,
                child: const AboutMeSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}