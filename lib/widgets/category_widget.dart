import 'package:flutter/material.dart';
import 'package:task6/utils/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final int count;
  const CategoryWidget({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(right:20),
        height: 210,
        width: 140,
        decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.whiteColor,size:50),
            SizedBox(height: 15,),
            Text(
              title,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text(
                  "${count.toString()} Task",
                  style: TextStyle(color: AppColors.whiteColor.withOpacity(0.6), fontSize: 16),
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.add, color: AppColors.whiteColor)),
          ],
        ),
      );
  }
}
