import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stock_wishlist/utils/constants.dart';
import 'package:stock_wishlist/views/home_page/home_page.dart';
import 'package:stock_wishlist/views/watch_list_page/watch_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget currentPage(int currentIndex){

    switch(currentIndex){
      case 0 :
      return const HomePage();
      
      case 1 :
      return const WatchListPage();

      default :
      return const HomePage();
    }
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: primaryColor,
        animationDuration: const Duration(milliseconds: 300),
        index: currentIndex,
        height: 50,
        items: const [
          Icon(Icons.home),
          Icon(Icons.list)
        ],
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        ),

        body: currentPage(currentIndex)
    );
  }
}