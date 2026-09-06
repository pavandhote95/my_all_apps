import 'package:flutter/material.dart';
import 'package:pavanportfolio/view%20model/responsive.dart';
import 'package:pavanportfolio/view/intro/components/intro_body.dart';
import 'package:pavanportfolio/view/intro/components/side_menu_button.dart';
import 'package:pavanportfolio/view/intro/components/social_media_list.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.01),

            SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
            if (!Responsive.isLargeMobile(context))
              const SocialMediaIconList(),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.07),
            const SizedBox(
              width: 1000, // Or wrap with Flexible/Expanded if dynamic
              child: IntroBody(),
            ),
          ],
        ),
      ),
    );
  }
}
