import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_site/sections/shared_widgets/social_icon_button.dart';


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
