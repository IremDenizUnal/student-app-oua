import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/Repository/teachers_repository.dart';

import 'modals/teacher.dart';

class teacherspage extends ConsumerWidget {
  const teacherspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersRepository = ref.watch(teachersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Teachers')),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32.0, horizontal: 32.0),
                    child:
                        Text('${teachersRepository.teachers.length} Teachers'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () {
                      ref.read(teachersProvider).download();
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => TeachersLine(
                      teachersRepository.teachers[
                          index]), //alt enterla student olusturduk asagıda
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: teachersRepository.teachers.length))
        ],
      ),
    );
  }
}

class TeachersLine extends StatelessWidget {
  final Teacher teacher;

  const TeachersLine(
    this.teacher, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(teacher.name + " " + teacher.surname),
      leading: IntrinsicWidth(
          child:
              Center(child: Text(teacher.gender == "woman" ? "👩" : " 🧑"))),
    );
  }
}
