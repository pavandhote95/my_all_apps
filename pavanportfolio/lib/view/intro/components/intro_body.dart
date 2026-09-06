import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'animated_texts_componenets.dart';
import 'combine_subtitle.dart';
import 'description_text.dart';
import 'download_button.dart';
import 'headline_text.dart';
class IntroBody extends StatelessWidget {
  const IntroBody({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!Responsive.isDesktop(context))
                SizedBox(
                  height: size.height * 0.06,
                ),
              if (!Responsive.isDesktop(context))
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.23,
                    ),
                    const AnimatedImageContainer(
                      width: 150,
                      height: 200,
                    ),
                  ],
                ),
              if (!Responsive.isDesktop(context))
                SizedBox(
                  height: size.height * 0.1,
                ),
              const Responsive(
                  desktop: MyPortfolioText(start: 40, end: 50),
                  largeMobile: MyPortfolioText(start: 40, end: 35),
                  mobile: MyPortfolioText(start: 35, end: 30),
                  tablet: MyPortfolioText(start: 50, end: 40)),
              if (kIsWeb && Responsive.isLargeMobile(context))
                Container(
                  height: defaultPadding,
                  color: Colors.transparent,
                ),
              SizedBox(height: 6,),
              const CombineSubtitleText(),
              const SizedBox(height: defaultPadding / 1),
              const Responsive(
                desktop: AnimatedDescriptionText(start: 14, end: 15),
                largeMobile: AnimatedDescriptionText(start: 14, end: 12),
                mobile: AnimatedDescriptionText(start: 14, end: 12),
                tablet: AnimatedDescriptionText(start: 17, end: 14),
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.github,
                    url: 'https://github.com/pavandhote',
                  ),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.twitter,
                    url: 'https://www.twitter.com/',
                  ),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.instagram,
                    url: 'https://www.instagram.com/',
                  ),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.linkedinIn,
                    url: 'https://www.linkedin.com/in/pavan-dhote-1ba9a2217',
                  ),
                ],
              ),

              const SizedBox(height: defaultPadding),
              const DownloadButton(),


            ],
          ),
        ),
        const Spacer(),
        if (Responsive.isDesktop(context)) const AnimatedImageContainer(),
        const Spacer()
      ],
    );
  }
}
Widget _buildSocialIcon({required IconData icon, required String url}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: InkWell(
      onTap: () async {
    final uri = Uri.parse(url);
    try {
      if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      )) {
  throw Exception('Could not launch $url');
  }
  } catch (e) {
  debugPrint('Error launching $url: $e');
  }


},
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: buttonColor, width: 2),
        ),
        child: Icon(
          icon,
          size: 16,
          color: buttonColor,
        ),
      ),
    ),
  );
}
