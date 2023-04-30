import 'package:flutter/material.dart';
import 'package:ogrenci_app/Repository/students_repository.dart';

class StudentsPage extends StatefulWidget {
  final StudentsRepository studentsRepository;
  const StudentsPage(this.studentsRepository, {Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10.0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 32.0),
                child: Text(
                    "${widget.studentsRepository.students.length} students"),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => StudentsLine(
                        widget.studentsRepository.students[index],
                        widget.studentsRepository,
                      ), //alt enterla student olusturduk asagıda
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: widget.studentsRepository.students.length))
        ],
      ),
    );
  }
}

class StudentsLine extends StatefulWidget {
  final student students;
  final StudentsRepository studentsRepository;
  const StudentsLine(
    this.students,
    this.studentsRepository, {
    super.key,
  });

  @override
  State<StudentsLine> createState() => _StudentsLineState();
}

class _StudentsLineState extends State<StudentsLine> {
  @override
  Widget build(BuildContext context) {
    bool doILike = widget.studentsRepository.doILike(widget.students);
    return ListTile(
      title: Text(widget.students.name + " " + widget.students.surname),
      leading: IntrinsicWidth(
          child: Center(
              child: Text(widget.students.gender == "woman" ? "👩" : " 🧑"))),
      trailing: IconButton(
          onPressed: () {
            setState(() {
              widget.studentsRepository.like(widget.students, !doILike);
            });
          },
          icon: Icon(doILike ? Icons.favorite : Icons.favorite_border)),
    );
  }
}
