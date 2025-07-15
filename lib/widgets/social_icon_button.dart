import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final double size;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
    this.size = 28,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = _isHovered
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).iconTheme.color;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        child: InkWell(
          onTap: () async {
            final uri = Uri.parse(widget.url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(
              widget.icon,
              size: widget.size,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
