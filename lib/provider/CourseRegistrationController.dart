import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../domain/coursemodel/coursemodel.dart';

class CourseRegistrationController extends ChangeNotifier {

  List<CourseModel> courseList = [];

  bool isLoading = false;

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

    } catch (e) {
      print('Error fetching courses: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}