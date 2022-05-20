import 'package:flutter/material.dart';
import 'dart:core';
import '../models/activities_data.dart';
import './search_screen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const routeName = '/welcome-screen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final _searchInput = TextEditingController();

  final List<IconData> _iconList = [
    Icons.arrow_back, Icons.home, Icons.notifications, Icons.arrow_forward,
  ];

  final List<String> _mood = [
    'Back', 'Home', 'Notif', 'Next',
  ];

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
        items: const [
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
                  padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text('Hi, Tommy', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                          const SizedBox(height: 8),
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
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(SearchScreen.routeName);
                          },
                          icon: const Icon(Icons.search, size: 32, color: Colors.white,),),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('how do you feel ?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
                      Icon(Icons.more_horiz),
                    ],
                  ),
                ),
                SizedBox(
                  height: 85,
                  width: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _mood.length,
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
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      height: constraints.maxHeight < 850 ? 170 : 300,
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
                                Icon(Icons.add),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 235,
                            width: double.infinity,
                            child: ListView.builder(
                              padding: const EdgeInsets.all(25),
                              physics: const BouncingScrollPhysics(),
                              itemCount: searchingList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
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
                                            child: searchingList[index].category,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(searchingList[index].title),
                                            Text('${searchingList[index].number} exercises'),
                                          ],
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.more_horiz),),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
