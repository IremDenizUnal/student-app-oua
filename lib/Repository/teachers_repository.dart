import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeachersRepository extends ChangeNotifier {
  List teachers = [
    teacher("Ali", "Yılmaz", 18, "Erkek"),
    teacher("Ayşe", "Çelik", 28, "Kadın")
  ];
}

final teachersProvider = ChangeNotifierProvider((ref) {
  return TeachersRepository();
});

class teacher {
  String name;
  String surname;
  int age;
  String gender;

  teacher(this.name, this.surname, this.age, this.gender);
}
