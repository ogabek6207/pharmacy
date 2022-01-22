
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/ui/profile/profile_screen.dart';

import 'card/card_screen.dart';
import 'category/category_screen.dart';
import 'favourite/favourite_screen.dart';
import 'home/home_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> data = [
    const HomeScreen(),
    const CategoryScreen(),
    const CardScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (_index) {
          setState(() {
            _selectedIndex = _index;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(
          color: Colors.red,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        selectedItemColor: const Color(0xFF3F8AE0),
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? SvgPicture.asset("assets/icons/home.svg")
                : SvgPicture.asset("assets/icons/home1.svg"),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset("assets/icons/medic1.svg")
                : SvgPicture.asset("assets/icons/medic.svg"),
            label: "Каталог",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? SvgPicture.asset("assets/icons/kor2.svg")
                : SvgPicture.asset("assets/icons/kor.svg"),
            label: "Корзина",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? SvgPicture.asset("assets/icons/heart1.svg")
                : SvgPicture.asset("assets/icons/heart.svg"),
            label: "Избранное",
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 4
                  ? SvgPicture.asset("assets/icons/menyu.svg")
                  : SvgPicture.asset("assets/icons/window.svg"),
              label: "Меню",)
        ],
      ),
    );
  }
}
