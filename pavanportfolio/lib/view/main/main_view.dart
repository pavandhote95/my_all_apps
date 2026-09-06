import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavanportfolio/res/constants.dart';
import 'package:pavanportfolio/view%20model/responsive.dart';
import 'package:pavanportfolio/view/main/components/navigation_bar.dart';
import 'components/drawer/drawer.dart';
import 'components/navigation_button_list.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.pages});
  final List<Widget> pages;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.pages.length, vsync: this);
    _pageController = PageController();
    _makeStatusBarWhite();
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.jumpToPage(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _makeStatusBarWhite() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, // White icons for Android
      statusBarBrightness: Brightness.light,     // White text for iOS
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // White icons
        statusBarBrightness: Brightness.light,     // White text
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: bgColor,
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            kIsWeb && !Responsive.isLargeMobile(context)
                ? const SizedBox(height: 32)
                : const SizedBox(height: 30),
            SizedBox(
              height: 80,
              child: TopNavigationBar(
                tabController: _tabController,
                pageController: _pageController,
              ),
            ),
            if (Responsive.isLargeMobile(context))
              Row(
                children: [
                  const Spacer(),
                  NavigationButtonList(
                    tabController: _tabController,
                    pageController: _pageController,
                  ),
                  const Spacer(),
                ],
              )
            else
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                onTap: (index) => _pageController.jumpToPage(index),
                tabs: const [
                  Tab(text: 'Home'),
                  Tab(text: 'Projects'),
                  Tab(text: 'Certifications'),
                ],
              ),
            Expanded(
              flex: 9,
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                onPageChanged: (index) {
                  _tabController.animateTo(index);
                },
                children: widget.pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}