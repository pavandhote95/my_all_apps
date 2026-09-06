import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/constants.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(
            'https://drive.google.com/file/d/1yv11hYCz9la6sAsejRwd2Kge3EazJBm8/view?usp=sharing'));
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: defaultPadding / 1.5,
          horizontal: defaultPadding * 2,
        ),
        decoration: BoxDecoration(
          color: buttonColor, // ✅ Using your global redAccent color
          borderRadius: BorderRadius.circular(10), // 🔷 Square corners
          boxShadow: const [
            BoxShadow(
              color: Color(0x55FF5252), // redAccent shadow
              offset: Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Download CV',
              style: GoogleFonts.montserrat(
                color: buttonTextColor,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.labelSmall?.fontSize, // Optional: Inherit size from theme
              ),
            ),
            const SizedBox(width: defaultPadding / 3),
            const Icon(
              FontAwesomeIcons.download,
              color: buttonTextColor,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
