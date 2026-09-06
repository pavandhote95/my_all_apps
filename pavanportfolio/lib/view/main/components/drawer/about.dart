import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavanportfolio/res/constants.dart';
import 'drawer_image.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: bgColor,
        child: Column(
          children: [
            const Spacer(flex: 2),
            const DrawerImage(),
            const Spacer(),
            Text(
              'Pavan Dhote',
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.titleSmall,
                fontWeight: FontWeight.w600, 
                color: Colors.white// Semi-bold
              ),
            ),
            const SizedBox(height: defaultPadding / 4),
            Text(
              'Flutter Developer\n Android, iOS, Web',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w300, // Light weight
                height: 1.5,
                fontSize: 12, // Adjust as needed
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}