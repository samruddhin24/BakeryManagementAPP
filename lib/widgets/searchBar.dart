import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust margins as needed
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppColors.white, // Background color of the search bar
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppColors.black, // Black outline
          width: 1.0, // Border width
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child:  TextField(
        decoration: InputDecoration(
          hintText: AppConstants.search, // Placeholder text
          hintStyle: const TextStyle(color: AppColors.grey), // Placeholder text color
          border: InputBorder.none, // Removes the default underline border
          icon: const Icon(Icons.search, color: AppColors.grey), // Search icon
        ),
      ),
    );
  }
}
