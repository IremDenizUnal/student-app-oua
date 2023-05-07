import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/teacher.dart';

class DataService {
  Teacher teacherDownload() {
    const j = """{
    "name" : "Yeni",
    "surname" : "Yenioğlu",
    "age" : 22,
    "gender" : "Man"
  }""";

    final m = jsonDecode(j as String);

    final teacher = Teacher.fromMap(m);
    return teacher;
  }
}
final dataServiceProvider = Provider((ref) {
  return DataService();
});
