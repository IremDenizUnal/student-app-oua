class StudentsRepository {

  List students =[
    student("Ali", "Yılmaz", 18, "Erkek"),
    student("Ayşe", "Çelik", 28, "Kadın")
  ];
}

class student {
  String name;
  String surname;
  int age;
  String gender;

  student(this.name, this.surname, this.age, this.gender);
}