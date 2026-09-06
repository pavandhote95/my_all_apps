import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'knowledge.dart';
import '../../../../res/constants.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: Colors.white24, thickness: 1),
          const SizedBox(height: defaultPadding / 2),

          Text('Knowledge', style: titleStyle),
          const SizedBox(height: defaultPadding / 2),

          const KnowledgeText(knowledge: 'Flutter, Dart'),
          const KnowledgeText(knowledge: 'Networking, Cyber Security'),
          const KnowledgeText(knowledge: 'Git, Github'),

          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
