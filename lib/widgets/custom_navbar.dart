import 'package:bakery_app/constants/app_colors.dart';
import 'package:bakery_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavbar extends StatefulWidget {
  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int selectedIndex = 0;

  final List<String> screens = [
    RouteConstants.homeScreen,
    RouteConstants.categoriesScreen,
    RouteConstants.favouritesScreen,
    RouteConstants.orderStatusScreen,
  ];

  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
    Get.offNamed(screens[index]);
  }

  void initState(){
    super.initState();
    updateSelectedIndex(Get.currentRoute);
  }

  void updateSelectedIndex(String route){
    setState(() {
      switch(route){
        case RouteConstants.homeScreen:
          selectedIndex = 0;
          break;
        case RouteConstants.categoriesScreen:
          selectedIndex = 1;
          break;
        case RouteConstants.favouritesScreen:
          selectedIndex = 2;
          break;
        case RouteConstants.orderStatusScreen:
          selectedIndex = 3;
          break;
        default:
          selectedIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildIcon(Icons.home, 0),
          buildIcon(Icons.grid_view, 1),
          buildIcon(Icons.favorite_outline, 2),
          buildIcon(Icons.person_outline, 3),
        ],
      ),
    );
  }


  Widget buildIcon(IconData icon, int index){
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary1.withOpacity(0.4) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? AppColors.primary1 : AppColors.darkGrey,
        ),
      ),
    );
  }

}
