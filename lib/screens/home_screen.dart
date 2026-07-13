import 'package:flutter/material.dart';
import 'package:task6/screens/add_task_screen.dart';
import 'package:task6/utils/app_colors.dart';
import 'package:task6/widgets/category_widget.dart';
import 'package:task6/widgets/today_task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Zeinab",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        "https://th.bing.com/th/id/R.6ae74c5f86466ef4f6fc6253c767381a?rik=XF0DZBSSdVICPw&pid=ImgRaw&r=0",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintText: 'search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Category",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryWidget(
                        icon: Icons.draw,
                        color: AppColors.pinkColor,
                        title: "Design",
                        count: 5,
                      ),
                      CategoryWidget(
                        icon: Icons.book,
                        color: AppColors.blueColor,
                        title: "Learning",
                        count: 3,
                      ),
                      CategoryWidget(
                        icon: Icons.meeting_room,
                        color: AppColors.yellowColor,
                        title: "Meeting",
                        count: 1,
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 40),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Task",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        TodayTaskWidget(
                          color: AppColors.greenColor,
                          icon: Icons.draw_outlined,
                          completedCounter: 2,
                          totalCounter: 4,
                          title: "Sketching",
                        ),
                        SizedBox(height: 20),
                        TodayTaskWidget(
                          color: AppColors.purpleColor,
                          icon: Icons.image_aspect_ratio_outlined,
                          completedCounter: 0,
                          totalCounter: 2,
                          title: "WireFraming",
                        ),
                        SizedBox(height: 20),
                        TodayTaskWidget(
                          color: AppColors.orangeColor,
                          icon: Icons.view_stream_rounded,
                          completedCounter: 4,
                          totalCounter: 8,
                          title: "VisualDesign",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTaskScreen()),
            );
          },
          backgroundColor: AppColors.purpleColor,
          child: Icon(Icons.add, color: AppColors.whiteColor, size: 25),
        ),
      ),
    );
  }
}
