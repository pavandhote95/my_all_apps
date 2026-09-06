import 'package:flutter/material.dart';
import 'navigation_button.dart';

class NavigationButtonList extends StatefulWidget {
  final TabController tabController;
  final PageController pageController;

  const NavigationButtonList({
    super.key,
    required this.tabController,
    required this.pageController,
  });

  @override
  State<NavigationButtonList> createState() => _NavigationButtonListState();
}

class _NavigationButtonListState extends State<NavigationButtonList> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.tabController.index;

    widget.tabController.addListener(() {
      if (selectedIndex != widget.tabController.index) {
        setState(() {
          selectedIndex = widget.tabController.index;
        });
      }
    });
  }

  void onTabTapped(int index) {
    widget.pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    widget.tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          NavigationTextButton(
            onTap: () => onTabTapped(0),
            text: 'Home',
            isSelected: selectedIndex == 0,
          ),
          NavigationTextButton(
            onTap: () => onTabTapped(1),
            text: 'Projects',
            isSelected: selectedIndex == 1,
          ),
          NavigationTextButton(
            onTap: () => onTabTapped(2),
            text: 'Certifications',
            isSelected: selectedIndex == 2,
          ),
        ],
      ),
    );
  }
}
