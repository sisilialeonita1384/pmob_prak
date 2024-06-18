import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:education_app/pages/home_body.dart';
import 'package:education_app/pages/history.dart';
import 'package:education_app/pages/donate.dart';
import 'package:education_app/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  List<Widget> pages = [
    HomeBody(),
    HistoryPage(),
    DonationPage(),
    ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 27, 94, 32),
          backgroundColor: Color.fromRGBO(251, 241, 221, 50),
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home, color: Color.fromARGB(255, 27, 94, 32)),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              activeIcon: Icon(Icons.history_rounded, color: Color.fromARGB(255, 27, 94, 32)),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              activeIcon: Icon(Icons.favorite_rounded, color: Color.fromARGB(255, 27, 94, 32)),
              label: "Donation",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              activeIcon: Icon(Icons.person, color: Color.fromARGB(255, 27, 94, 32)),
              label: "Account",
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: pages,
        ),
      ),
    );
  }
}
