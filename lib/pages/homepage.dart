import 'package:education_app/pages/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:education_app/pages/history.dart';
import 'package:education_app/pages/donate.dart';
import 'package:education_app/pages/profile.dart';
import 'package:get/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> pages = [
    HomeBody(),
    HistoryPage(),
    DonatePage(),
    ProfilePage(userData: {},)
  ];
  
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 27, 94, 32) ,
          backgroundColor: Color.fromRGBO(251, 241, 221, 50),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color:Color.fromARGB(255, 27, 94, 32) ,),
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.group, color:Color.fromARGB(255, 27, 94, 32)),
              icon: Icon(Icons.group_outlined),
              label: "Community",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite_border, color:Color.fromARGB(255, 27, 94, 32)),
              icon: Icon(Icons.favorite_border_outlined),
              label: "Donation",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person, color:Color.fromARGB(255, 27, 94, 32)
              ),
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: "Account",
            ),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: pages[_currentIndex],
        
      ),
    );
  }
}





