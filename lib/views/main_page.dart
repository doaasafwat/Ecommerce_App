import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/views/cart_view.dart';
import 'package:ecommerce_app/views/favorites_view.dart';
import 'package:ecommerce_app/views/home_view.dart';
import 'package:ecommerce_app/widgets/custom_curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 1;

  final List<Map<String, dynamic>> appBarSettings = [
    {
      'icon': Icons.shopping_cart,
      'text': 'My Cart',
    },
    {
      'icon': Icons.sort,
      'text': 'DP Shop',
    },
    {
      'icon': Icons.favorite,
      'text': 'Favorites',
    },
  ];

  final List<Widget> pages = [
    const CartView(),
    const HomeView(),
    const FavoritesView(),
  ];

  void _goBack() {
    setState(() {
      _pageIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _pageIndex == 0 
          ? AppBar(
              leading: BackButton(
                onPressed: _goBack,
              ),
              title: const Text(
                'My Cart',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            )
          : AppBar(
              leading: Icon(
                appBarSettings[_pageIndex]['icon'],
                color: primaryColor,
              ),
              title: Text(
                appBarSettings[_pageIndex]['text'],
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
      body: pages[_pageIndex],
      bottomNavigationBar: Visibility(
        visible: _pageIndex != 0,
        child: CustomCurvedNavigationBar(
          index: _pageIndex,
          ontap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
