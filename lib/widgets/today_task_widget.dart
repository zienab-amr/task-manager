import 'package:flutter/material.dart';
import 'package:task6/utils/app_colors.dart';

class TodayTaskWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final int completedCounter;
  final int totalCounter;
  const TodayTaskWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.completedCounter,
    required this.totalCounter,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: AppColors.whiteColor, size: 30),
        ),
        SizedBox(width: 10,),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              )
              ),
              Center(
                child: Text(
                "${completedCounter.toString()} Completed",
                style: TextStyle(
                  color: AppColors.greyColor.withOpacity(0.8),
                  fontSize: 20,
                ),
                            ),
              ),        
          ],
        ),
          ],
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: BoxBorder.all(
              color: color,
              width: 2
            )
          ),
          child: Text(
            totalCounter.toString(),
            style: TextStyle(
                color: color.withOpacity(0.8),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )
        
        )
      ],
    );
  }
}
