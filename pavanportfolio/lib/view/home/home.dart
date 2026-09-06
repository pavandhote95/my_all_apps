import 'package:flutter/material.dart';
import 'package:pavanportfolio/view/certifications/certifications.dart';
import 'package:pavanportfolio/view/intro/introduction.dart';
import 'package:pavanportfolio/view/main/main_view.dart';
import 'package:pavanportfolio/view/projects/project_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainView(
      pages:  [

        Introduction(),
        ProjectsView(),
        Certifications(),

      ],
    );
  }
}
