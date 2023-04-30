
class TeachersRepository {

  List teachers =[
    teacher("Ali", "Yılmaz", 18, "Erkek"),
    teacher("Ayşe", "Çelik", 28, "Kadın")
  ];
}

class teacher {
  String name;
  String surname;
  int age;
  String gender;

  teacher(this.name, this.surname, this.age, this.gender);
}