import 'package:flutter/material.dart';
import 'home.dart';  // Import your home.dart only once here.
import 'news_feed.dart';
import 'my_job.dart';
import 'profile.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';
import 'splash_screen.dart';


void main() {
  runApp(StarLinkApp());
}

class StarLinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Start from splash screen

      routes: {
        '/': (context) => SplashScreen(), // Splash screen
        '/login': (context) => LoginPage(), // Login page
        '/register': (context) =>RegistrationPage(), // Register page
        '/main': (context) => MainPage(), // Main page after login
      },
    );
  }


  }


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    MyJobPage(),
    NewsFeedPage(),
    ProfilePage(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.work,
    Icons.feed,
    Icons.person,
  ];

  final List<String> _labels = [
    'Home',
    'My Job',
    'News Feed',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0,
          selectedFontSize: 13,
          unselectedFontSize: 12,
          items: List.generate(_icons.length, (index) {
            return BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.only(top: _selectedIndex == index ? 0 : 4),
                child: Icon(
                  _icons[index],
                  size: _selectedIndex == index ? 30 : 26,
                ),
              ),
              label: _labels[index],
            );
          }),
        ),
      ),
    );
  }
}
