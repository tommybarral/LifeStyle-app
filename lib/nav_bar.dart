import 'package:flutter/material.dart';
import 'package:lifestyle_app/screens/content_screen.dart';
import 'package:lifestyle_app/screens/profile_screen.dart';
import 'package:lifestyle_app/screens/shopping_bag_screen.dart';
import 'package:lifestyle_app/screens/welcome_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int _selectedIndex = 0;

  List<Widget> _pages = [
    WelcomeScreen(),
    ContentScreen(),
    ShoppingBagScreen(),
    ProfileScreen(),
  ];

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: onTap,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
            activeIcon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}
