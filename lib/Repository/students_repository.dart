class StudentsRepository {

  final students =[
    student("Ali", "Yılmaz", 18, "Man"),
    student("Ayşe", "Çelik", 28, "Woman")
  ];
final Set<student> myLikes = {};


  void like(student students, bool doIlike) {
    if (doIlike){
      myLikes.add(students);
    }else{
      myLikes.remove(students);
    }

  }

  bool doILike(student students) {
   return myLikes.contains(students);
  }
}



class student {
  String name;
  String surname;
  int age;
  String gender;

  student(this.name, this.surname, this.age, this.gender);
}