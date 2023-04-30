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
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                child: Text("10 students"),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                        title: const Text("Ayşe"),
                        leading: const Text("👩"), //🧑👩
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border)),
                      ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 25))
        ],
      ),
    );
  }
}
