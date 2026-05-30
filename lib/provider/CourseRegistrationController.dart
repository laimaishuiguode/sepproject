import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../domain/coursemodel/coursemodel.dart';

class CourseRegistrationController extends ChangeNotifier {

  List<CourseModel> courseList = [];
  List<CourseModel> displayList = [];

  bool isLoading = false;
  String searchQuery = '';
  String? selectedFaculty = 'All Faculties';

  Future<void> getCourses() async {
    isLoading = true;
    notifyListeners();

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('courses')
          .get();

      courseList = snapshot.docs
          .map((doc) => CourseModel.fromJson(doc.data()))
          .toList();

      displayList = courseList;
      notifyListeners();

    } catch (e) {
      print('Error fetching courses: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  void searchCourse(String query) {
    searchQuery = query.toLowerCase();
    _updateDisplay();
  }

  void filterCourse(String faculty) {
    selectedFaculty = faculty;
    _updateDisplay();
  }

  List<CourseModel> displayCourseList() {
    return displayList;
  }

  void _updateDisplay() {
    displayList = courseList;

    // Apply search filter
    if (searchQuery.isNotEmpty) {
      displayList = displayList.where((course) {
        final courseCode = course.course_code.toLowerCase();
        final courseName = course.course_name.toLowerCase();
        final lecturerId = course.lecturer_id.toLowerCase();

        return courseCode.contains(searchQuery) ||
            courseName.contains(searchQuery) ||
            lecturerId.contains(searchQuery);
      }).toList();
    }

    // Apply faculty filter
    if (selectedFaculty != 'All Faculties') {
      displayList = displayList.where((course) {
        return course.faculty == selectedFaculty;
      }).toList();
    }

    notifyListeners();
  }
}