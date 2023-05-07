import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/Repository/students_repository.dart';

import 'modals/student.dart';

class StudentsPage extends ConsumerWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsRepository = ref.watch(studentsProvider);
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
                child: Text("${studentsRepository.students.length} students"),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => StudentsLine(
                        studentsRepository.students[index],
                      ), //alt enterla student olusturduk asagıda
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: studentsRepository.students.length))
        ],
      ),
    );
  }
}

class StudentsLine extends ConsumerWidget {
  final Student student;

  const StudentsLine(
    this.student, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool doILike = ref.watch(studentsProvider).doILike(student);
    return ListTile(
      title: Text(student.name + " " + student.surname),
      leading: IntrinsicWidth(
          child: Center(child: Text(student.gender == "woman" ? "👩" : " 🧑"))),
      trailing: IconButton(
          onPressed: () {
            ref.read(studentsProvider).like(student, !doILike);
          },
          icon: Icon(doILike ? Icons.favorite : Icons.favorite_border)),
    );
  }
}
