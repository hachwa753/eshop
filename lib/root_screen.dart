import 'package:ecommerceappui/cart_page.dart';
import 'package:ecommerceappui/home_page.dart';
import 'package:ecommerceappui/profile_page.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;
  List _pages = [HomePage(), CartPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: _pages[selectedIndex],
    );
  }
}
