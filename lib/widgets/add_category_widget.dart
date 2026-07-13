import 'package:flutter/material.dart';
import 'package:task6/utils/app_colors.dart';

class AddCategoryWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;

  final VoidCallback onTap;
  final bool isSelected;

  const AddCategoryWidget({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 20),
        height: 150,
        width: 130,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.whiteColor, size: 50),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}