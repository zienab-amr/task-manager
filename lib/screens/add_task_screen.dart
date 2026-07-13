import 'package:flutter/material.dart';
import 'package:task6/utils/app_colors.dart';
import 'package:task6/widgets/add_category_widget.dart';

class TaskModel {
  String title;
  String description;
  String category;
  DateTime date;
  TimeOfDay time;
  bool isCompleted;

  TaskModel({
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.time,
    this.isCompleted = false,
  });
}



class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  final taskNameController = TextEditingController();
  final descriptionController = TextEditingController();

  String? selectedCategory;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

Future<void> pickTime() async {
  final time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (time != null) {
    setState(() {
      selectedTime = time;
    });
  }
}

Future<void> pickDate() async {
  final date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2035),
  );

  if (date != null) {
    setState(() {
      selectedDate = date;
    });
  }
}

@override
void dispose() {
  taskNameController.dispose();
  descriptionController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New Task",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    // 1. أضفنا SingleChildScrollView هنا لحل مشكلة الكيبورد
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Task Name",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: taskNameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Task name is required";
                              }
            
                              if (value.length < 3) {
                                return "Minimum 3 characters";
                              }
            
                              return null;
                            },
                            decoration: InputDecoration(hintText: "write here...."),
                          ),
                          Text(
                            "Category",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 25),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                AddCategoryWidget(
                                  icon: Icons.draw,
                                  color: AppColors.pinkColor,
                                  title: "Design",
                                  isSelected: selectedCategory == "Design",
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = "Design";
                                    });
                                  },
                                ),
                                AddCategoryWidget(
                                  icon: Icons.book,
                                  color: AppColors.blueColor,
                                  title: "Learning",
                                  isSelected: selectedCategory == "Learning",
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = "Learning";
                                    });
                                  },
                                ),
                                AddCategoryWidget(
                                  icon: Icons.meeting_room,
                                  color: AppColors.yellowColor,
                                  title: "Meeting",
                                  isSelected: selectedCategory == "Meeting",
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = "Meeting";
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                  
                          Text(
                            "Date and Time",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                          const SizedBox(height: 15),
                          
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: pickDate,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      selectedDate == null
                                          ? "Select Date"
                                          : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                    ),
                                  ),
                                ),
                              ),
                          
                              const SizedBox(width: 15),
                          
                              Expanded(
                                child: GestureDetector(
                                  onTap: pickTime,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      selectedTime == null
                                          ? "Select Time"
                                          : selectedTime!.format(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                          const SizedBox(height: 10),
                          
                          TextFormField(
                            controller: descriptionController,
                            maxLines: 4,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Description is required";
                              }
                          
                              return null;
                            },
                          ),
                          
                          // 2. قمنا باستبدال Spacer بـ SizedBox لتفادي خطأ الطول غير المحدود
                          const SizedBox(height: 40),
                          
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                          
                                if (!_formKey.currentState!.validate()) {
                                  // إذا كانت الحقول النصية فارغة، سيظهر خطأ باللون الأحمر تحتها وسيتوقف الكود هنا
                                  return;
                                }
                          
                                if (selectedCategory == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please select category"),
                                    ),
                                  );
                                  return;
                                }
                          
                                if (selectedDate == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please select date"),
                                    ),
                                  );
                                  return;
                                }
                          
                                if (selectedTime == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please select time"),
                                    ),
                                  );
                                  return;
                                }
                          
                                TaskModel task = TaskModel(
                                  title: taskNameController.text.trim(),
                                  description: descriptionController.text.trim(),
                                  category: selectedCategory!,
                                  date: selectedDate!,
                                  time: selectedTime!,
                                );
                          
                                print(task.title);
                          
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Create Task",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
