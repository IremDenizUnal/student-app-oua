import 'package:flutter/material.dart';
import 'package:ogrenci_app/Repository/teachers_repository.dart';

class teacherspage extends StatefulWidget {
  final TeachersRepository teachersRepository;
  const teacherspage(this.teachersRepository, {Key? key}) : super(key: key);

  @override
  State<teacherspage> createState() => _teacherspageState();
}

class _teacherspageState extends State<teacherspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teachers')),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 32.0),
                child: Text(
                    '${widget.teachersRepository.teachers.length} Teachers'),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => TeachersLine(
                        widget.teachersRepository.teachers[index],
                        widget.teachersRepository,
                      ), //alt enterla student olusturduk asagıda
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: widget.teachersRepository.teachers.length))
        ],
      ),
    );
  }
}

class TeachersLine extends StatefulWidget {
  final teacher teachers;
  final TeachersRepository teachersRepository;
  const TeachersLine(
    this.teachers,
    this.teachersRepository, {
    super.key,
  });

  @override
  State<TeachersLine> createState() => _TeachersLineState();
}

class _TeachersLineState extends State<TeachersLine> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.teachers.name + " " + widget.teachers.surname),
      leading: IntrinsicWidth(
          child: Center(
              child: Text(widget.teachers.gender == "woman" ? "👩" : " 🧑"))),
    );
  }
}
