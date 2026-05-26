import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kalam/provider/CourseRegistrationController.dart';

class CourseCatalogue extends StatefulWidget {
  const CourseCatalogue({super.key});

  @override
  State<CourseCatalogue> createState() => _CourseCatalogueState();
}

class _CourseCatalogueState extends State<CourseCatalogue> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CourseRegistrationController>().getCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CourseRegistrationController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ================= BODY =================
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Course Catalog",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),

                    const Text(
                      "Browse available courses and sections",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ================= SEARCH =================
                    TextField(
                      decoration: InputDecoration(
                        hintText:
                            "Search by course code, name, or instructor",
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ================= FILTERS =================
                    Row(
                      children: [
                        Expanded(
                          child: filterDropdown("All Days"),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: filterDropdown("All Modes"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: filterDropdown("All Faculties"),
                    ),

                    const SizedBox(height: 18),

                    Text(
                      "Showing ${controller.courseList.length} courses",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 18),

                    // ================= COURSE LIST =================
                    controller.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : controller.courseList.isEmpty
                            ? const Center(
                                child: Text("No courses available"),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.courseList.length,
                                itemBuilder: (context, index) {
                                  final course = controller.courseList[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: courseCard(course),
                                  );
                                },
                              ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget filterDropdown(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget courseCard(dynamic course) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================= TOP =================
          Row(
            children: [
              Text(
                course.course_code,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 10),

              tag("Section ${course.section}", Colors.black),
              const SizedBox(width: 6),

              tag(
                "Lecture",
                Colors.indigo.shade100,
                textColor: Colors.indigo,
              ),

              const Spacer(),

              const Icon(Icons.keyboard_arrow_up),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            course.course_name,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          infoRow(Icons.calendar_today, "Time: ${course.class_time}", ""),
          const SizedBox(height: 10),

          infoRow(Icons.location_on_outlined, "Venue: ${course.venue}", ""),
          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(
                Icons.people_outline,
                size: 18,
                color: Colors.grey,
              ),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                  children: [
                    const TextSpan(text: "Capacity: "),
                    TextSpan(
                      text: "${course.register_student_count}/${course.capacity_limit}",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          infoRow(
            Icons.person_outline,
            "Instructor: ${course.lecturer_id}",
            "",
          ),

          const SizedBox(height: 10),

          infoRow(
            Icons.book_outlined,
            "Final Exam: ${course.final_exam_date.toString().split(' ')[0]}",
            "",
          ),

          const SizedBox(height: 10),

          infoRow(
            Icons.school_outlined,
            "Credits: ${course.credit_hour}",
            "",
          ),

          const SizedBox(height: 10),

          infoRow(
            Icons.category_outlined,
            "Section: ${course.section}",
            "",
          ),

          const SizedBox(height: 10),

          infoRow(
            Icons.people_alt_outlined,
            "Registered: ${course.register_student_count}",
            "",
          ),

          const SizedBox(height: 10),

          infoRow(
            Icons.event_seat_outlined,
            "Total Capacity: ${course.capacity_limit}",
            "",
          ),

          const SizedBox(height: 18),

          const Divider(),

          const SizedBox(height: 12),

          const Text(
            "Course Description",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            course.course_description,
            style: const TextStyle(
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget tag(
    String text,
    Color bgColor, {
    Color textColor = Colors.white,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget infoRow(
    IconData icon,
    String title,
    String trailing,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.grey,
        ),
        const SizedBox(width: 8),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ),

        if (trailing.isNotEmpty)
          Text(
            trailing,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
      ],
    );
  }
}