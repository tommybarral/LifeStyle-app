import 'package:flutter/material.dart';
import 'package:lifestyle_app/models/activities_data.dart';
import 'package:lifestyle_app/screens/profile_screen.dart';
import 'package:lifestyle_app/screens/search_screen.dart';
import 'package:lifestyle_app/screens/shopping_bag_screen.dart';
import './screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        ShoppingBagScreen.routeName: (context) => ShoppingBagScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}