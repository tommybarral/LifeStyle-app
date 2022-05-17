import 'package:flutter/material.dart';

class ShoppingBagScreen extends StatelessWidget {
  const ShoppingBagScreen({Key? key}) : super(key: key);

  static const routeName = '/shopping-bag-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Shopping bag Screen')),
    );
  }
}
