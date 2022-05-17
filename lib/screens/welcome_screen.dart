import 'package:flutter/material.dart';
import 'dart:core';
import 'package:lifestyle_app/nav_bar.dart';
import 'content_screen.dart';
import 'profile_screen.dart';
import 'shopping_bag_screen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  static const routeName = '/welcome-screen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final _searchInput = TextEditingController();

  List<IconData> _iconList = [
    Icons.home, Icons.arrow_back, Icons.notifications, Icons.more,
  ];

  List<String> _mood = [
    'badly', 'fine', 'well', 'excellent',
  ];


  Map<String, String> mood = {
    'Icons.home' : 'Badly',
    'Icons.arrow_forward' : 'Fine',
    'Icons.notifications' : 'Well',
    'Icons.more' : 'Excellent',
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
       // currentIndex: _selectedIndex,
        //onTap: onTap,
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
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Hi, Tommy', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                          SizedBox(height: 8),
                          Text('Datetime.now()', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue[200]),),
                        ],
                      ),
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.notifications, color: Colors.white,),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _searchInput,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Search',
                        fillColor: Colors.white,
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('how do you feel ?', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
                      Icon(Icons.more_horiz),
                    ],
                  ),
                ),
                Container(
                  height: 85,
                  width: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mood.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  splashRadius: 25,
                                  splashColor: Colors.blue[200],
                                  icon: Icon(_iconList[index], size: 28, color: Colors.white,),),
                            ),
                            Text(_mood[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 5,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 25.0, right: 25.0, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Activities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 235,
                        width: double.infinity,
                          child: ListView.builder(
                            padding: EdgeInsets.all(25),
                            physics: const BouncingScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 18.0),
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.black12,)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Icon(Icons.home, size: 32, color: Colors.white,),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Speaking skills'),
                                          Text('16 exercises'),
                                        ],
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.more_horiz),),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
