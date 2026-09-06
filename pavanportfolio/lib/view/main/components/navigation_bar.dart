import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:pavanportfolio/view%20model/responsive.dart';
import 'package:pavanportfolio/view/intro/components/side_menu_button.dart';
import 'package:pavanportfolio/view/main/components/connect_button.dart';
import '../../../res/constants.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  final TabController tabController;
  final PageController pageController;

  const TopNavigationBar({
    super.key,
    required this.tabController,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Only show drawer on mobile (NOT on web)
      // drawer: !kIsWeb && Responsive.isLargeMobile(context)
      //     ? const Drawer(child: Center(child: Text("Menu"))) // your drawer here
      //     : null, // 🚫 No drawer on Web = no default hamburger icon
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: (!Responsive.isLargeMobile(context) && !kIsWeb)
                ? Image.asset('assets/images/triange_icon.png') // App large screen
                : MenuButton(onTap: () => Scaffold.of(context).openDrawer()), // Web or mobile small screen
          ),
          const Spacer(flex: 2),
          if (!Responsive.isLargeMobile(context))
            NavigationButtonList(
              tabController: tabController,
              pageController: pageController,
            ),
          const Spacer(flex: 10),
          const ConnectButton(),
          const Spacer(),
        ],
      ),
    );
  }
}
