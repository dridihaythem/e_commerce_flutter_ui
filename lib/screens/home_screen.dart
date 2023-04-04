import 'package:e_com/screens/categories_display_screen.dart';
import 'package:e_com/screens/products_display_screen.dart';
import 'package:e_com/screens/shopping_cart_screen.dart';
import 'package:e_com/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;

  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (e) => setState(() {
                _currentPage = e;
              }),
              children: const [
                ProductsDisplayScreen(),
                CategoriesDisplayScreen(),
                ShoppingCartScreen(),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              height: 70,
              child: Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        _pageController.jumpToPage(0);
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _pageController.jumpToPage(1);
                      },
                      icon: const Icon(
                        Icons.list_alt,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _pageController.jumpToPage(2);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
