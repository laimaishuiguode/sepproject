import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final String course_code;
  final String course_name;
  final String course_description;
  final String venue;
  final String class_time;
  final int credit_hour;
  final String section;
  final String lecturer_id;
  final int capacity_limit;
  final DateTime final_exam_date;
  final int register_student_count;

  CourseModel({
    required this.course_code,
    required this.course_name,
    required this.course_description,
    required this.venue,
    required this.class_time,
    required this.credit_hour,
    required this.section,
    required this.lecturer_id,
    required this.capacity_limit,
    required this.final_exam_date,
    required this.register_student_count,
  });


factory CourseModel.fromJson(Map<String, dynamic> json) {

    return CourseModel(
      course_code: json['course_code'],
      course_name: json['course_name'],
      course_description: json['course_description'],
      venue: json['venue'],
      class_time: json['class_time'],
      credit_hour: json['credit_hour'],
      section: json['section'],
      lecturer_id: json['lecturer_id'],
      capacity_limit: json['capacity_limit'],
      final_exam_date: json['final_exam_date'] is Timestamp 
          ? (json['final_exam_date'] as Timestamp).toDate()
          : DateTime.parse(json['final_exam_date']),
      register_student_count: json['register_student_count'],
    );
}
}