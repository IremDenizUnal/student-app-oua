import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/teacher.dart';
import 'package:ogrenci_app/services/data_service.dart';

class TeachersRepository extends ChangeNotifier {
  List teachers = [
    Teacher("Ali", "Yılmaz", 18, "Erkek"),
    Teacher("Ayşe", "Çelik", 28, "Kadın")
  ];
final DataService dataService;
  TeachersRepository(this.dataService);

  void download(){
   Teacher teacher = dataService.teacherDownload();
   teachers.add(teacher);
   notifyListeners();

  }
}

final teachersProvider = ChangeNotifierProvider((ref) {

  return TeachersRepository(ref.watch(dataServiceProvider));
});

