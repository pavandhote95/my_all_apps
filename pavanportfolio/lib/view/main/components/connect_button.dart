import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse('https://wa.me/7415743916'));
        },
        borderRadius: BorderRadius.circular(defaultPadding + 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/whatsapp.png', // ✅ Make sure this image exists in assets
              height: 35,
              width: 35,
            ),
            const SizedBox(width: 8),

          ],
        ),
      ),
    );
  }
}
