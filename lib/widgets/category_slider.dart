import 'package:bakery_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import '../models/category_slider_model.dart';

class CategorySlider extends StatelessWidget {
  final List<CategoryModel> categories = [
    CategoryModel(imagePath: ImageConstants.cake, label: AppConstants.cake),
    CategoryModel(imagePath: ImageConstants.muffin, label: AppConstants.muffin),
    CategoryModel(
        imagePath: ImageConstants.chocolate, label: AppConstants.chocolate),
    CategoryModel(
        imagePath: ImageConstants.cookies, label: AppConstants.cookies),
    CategoryModel(imagePath: ImageConstants.donut, label: AppConstants.donut),
    CategoryModel(imagePath: ImageConstants.toast, label: AppConstants.toast),
    CategoryModel(imagePath: ImageConstants.chips, label: AppConstants.chips),
    CategoryModel(imagePath: ImageConstants.sweets, label: AppConstants.sweets),
    CategoryModel(imagePath: ImageConstants.pastry, label: AppConstants.pastry),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.categories,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CategoryItem(
                      imagePath: category.imagePath, label: category.label),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryItem({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
