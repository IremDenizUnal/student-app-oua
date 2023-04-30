import 'package:flutter/material.dart';
import 'package:ogrenci_app/Repository/messages_repository.dart';
import 'package:ogrenci_app/Repository/students_repository.dart';
import 'package:ogrenci_app/Repository/teachers_repository.dart';
import 'package:ogrenci_app/messages_page.dart';
import 'package:ogrenci_app/students_page.dart';
import 'package:ogrenci_app/teachers_page.dart';

void main() {
  runApp(const OgrenciApp());
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(title: 'Student main page'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MessagesRepository messagesRepository = MessagesRepository();
  StudentsRepository studentsRepository = StudentsRepository();
  TeachersRepository teachersRepository = TeachersRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              child: Text('${messagesRepository.messages.length} new message'),
              onPressed: () {
                _goMessages(context);
              },
            ),
            TextButton(
              child: Text('${studentsRepository.students.length} students'),
              onPressed: () {
                _goStudents(context);
              },
            ),
            TextButton(
              child: Text('${teachersRepository.teachers.length} teachers'),
              onPressed: () {
                _goTeachers(context);
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Student name'),
            ),
            ListTile(
              title: const Text('Students'),
              onTap: () {
                _goStudents(context);
              },
            ),
            ListTile(
              title: const Text('Teachers'),
              onTap: () {
                _goTeachers(context);
              },
            ),
            ListTile(
              title: const Text('Messages'),
              onTap: () {
                _goMessages(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _goStudents(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return StudentsPage(studentsRepository);
      },
    ));
  }

  void _goTeachers(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return teacherspage(teachersRepository);
      },
    ));
  }

  void _goMessages(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return messagespage(messagesRepository);
      },
    ));
  }
}
