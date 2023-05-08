import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/Repository/teachers_repository.dart';
import 'package:ogrenci_app/pages/teacher_form.dart';

import 'modals/teacher.dart';

class TeachersPage extends ConsumerWidget {
  const TeachersPage({Key? key}) : super(key: key);

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
                const Align(
                  alignment: Alignment.centerRight,
                  child: TeacherDownloadButton(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final created =
              await Navigator.of(context).push<bool>(MaterialPageRoute(
            builder: (context) {
              return const TeacherForm();
            },
          ));

          if (created == true) {
            print("Reload teachers");
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TeacherDownloadButton extends StatefulWidget {
  const TeacherDownloadButton({
    super.key,
  });

  @override
  State<TeacherDownloadButton> createState() => _TeacherDownloadButtonState();
}

class _TeacherDownloadButtonState extends State<TeacherDownloadButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return isLoading
          ? const CircularProgressIndicator()
          : IconButton(
              icon: const Icon(Icons.download),
              onPressed: () async {
                //TODO loading
                //TODO error
                try {
                  setState(() {
                    isLoading = true;
                  });

                  await ref.read(teachersProvider).download();
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
            );
    });
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
      title: Text("${teacher.name} ${teacher.surname}"),
      leading: IntrinsicWidth(
          child: Center(child: Text(teacher.gender == "woman" ? "👩" : " 🧑"))),
    );
  }
}
