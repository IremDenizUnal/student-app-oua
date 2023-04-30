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
          const PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                child: Text('10 Teachers'),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => const ListTile(
                title: Text('Ayşe'),
                leading: Text('👩‍🦰'), //👨‍🦰
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 25,
            ),
          ),
        ],
      ),
    );
  }
}
