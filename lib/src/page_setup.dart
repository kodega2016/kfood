import 'package:flutter/material.dart';

import 'screens/cart.dart';
import 'screens/home.dart';
import 'screens/wishlist.dart';

class PageSetup extends StatefulWidget {
  @override
  _PageSetupState createState() => _PageSetupState();
}

class _PageSetupState extends State<PageSetup> {
  int _page = 0;
  void _changePage(i) => setState(() => _page = i);
  var _pages = <Widget>[
    HomeScreen(),
    WishListScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: _changePage,
        backgroundColor: Colors.white,
        elevation: 4.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wine_bar_sharp),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
