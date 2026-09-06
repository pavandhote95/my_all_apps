import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../res/constants.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

    final sectionSpacing = defaultPadding * 0.8;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: defaultPadding / 2),

          Text('Contact Info', style: titleStyle),
          const SizedBox(height: defaultPadding / 2),

          const AreaInfoText(title: '📞 Phone', text: '7415743916'),
          const AreaInfoText(title: '📧 Email', text: 'pavandhote95@gmail.com'),
          const AreaInfoText(title: '🔗 LinkedIn', text: 'pavan dhote'),
          const AreaInfoText(title: '💻 Github', text: 'pavan dhote'),

          SizedBox(height: sectionSpacing),
          Divider(color: Colors.white24, thickness: 1),
          SizedBox(height: sectionSpacing),

          Text('Skills', style: titleStyle),
          const SizedBox(height: defaultPadding / 2),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              SkillChip(label: 'Flutter'),
              SkillChip(label: 'Dart'),
              SkillChip(label: 'Firebase'),
              SkillChip(label: 'REST APIs'),
              SkillChip(label: 'GetX'),
              SkillChip(label: 'UI/UX Design'),
            ],
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;
  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.redAccent.withOpacity(0.85),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
