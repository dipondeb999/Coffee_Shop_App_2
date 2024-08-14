import 'package:coffee_shop_2/components/bottom_nav_bar.dart';
import 'package:coffee_shop_2/constant.dart';
import 'package:coffee_shop_2/screens/cart_screen.dart';
import 'package:coffee_shop_2/screens/shop_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  void navigatedBottomBar(index) {
    setState(() {
      _selectIndex = index;
    });
  }

  // screens
  final List<Widget> _screens = [
    // shop screen
    const ShopScreen(),
    // cart screen
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTapChange: (index) => navigatedBottomBar(index),
      ),
      body: _screens[_selectIndex],
    );
  }
}
