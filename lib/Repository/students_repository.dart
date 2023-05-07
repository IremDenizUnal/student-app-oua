import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/student.dart';

class StudentsRepository extends ChangeNotifier {
  final students = [
    Student("Ali", "Yılmaz", 18, "Man"),
    Student("Ayşe", "Çelik", 28, "Woman")
  ];


  final Set<Student> myLikes = {};

  void like(Student student, bool doIlike) {
    if (doIlike) {
      myLikes.add(student);
    } else {
      myLikes.remove(student);
    }
    notifyListeners();
  }

  bool doILike(Student student) {
    return myLikes.contains(student);
  }
}

final studentsProvider = ChangeNotifierProvider((ref) {
  return StudentsRepository();
});
