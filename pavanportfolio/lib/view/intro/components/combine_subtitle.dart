import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:pavanportfolio/view/intro/components/subtitle_text.dart';
import '../../../view model/responsive.dart';

import 'package:flutter/material.dart';

import '../../../view model/responsive.dart';

class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: AnimatedSubtitleText(start: 30, end: 40),
      largeMobile: AnimatedSubtitleText(start: 30, end: 25),
      mobile: AnimatedSubtitleText(start: 25, end: 20),
      tablet: AnimatedSubtitleText(start: 40, end: 30),
    );
  }
}

