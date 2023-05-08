import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/services/data_service.dart';

import '../modals/teacher.dart';

class TeacherForm extends ConsumerStatefulWidget {
  const TeacherForm({Key? key}) : super(key: key);

  @override
  _TeacherFormState createState() => _TeacherFormState();
}

class _TeacherFormState extends ConsumerState<TeacherForm> {
  final Map<String, dynamic> entered = {};
  final _formKey = GlobalKey<FormState>();

  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Teacher"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Name"),
                  ),
                  validator: (value) {
                    if (value?.isNotEmpty != true) {
                      return "You need to enter a name";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    entered["name"] = newValue;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Surname"),
                  ),
                  validator: (value) {
                    if (value?.isNotEmpty != true) {
                      return "You need to enter a surname";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    entered["surname"] = newValue;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Age"),
                  ),
                  validator: (value) {
                    if (value == null || value.isNotEmpty != true) {
                      return "You need to enter an age";
                    }
                    if (int.tryParse(value) == null) {
                      return "You need to ender an age with numbers";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) {
                    entered["age"] = int.parse(newValue!);
                  },
                ),
                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: "Male",
                      child: Text("Male"),
                    ),
                    DropdownMenuItem(
                      value: "Female",
                      child: Text("Female"),
                    )
                  ],
                  value: entered["gender"],
                  onChanged: (value) {
                    setState(() {
                      entered["gender"] = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please choose gender";
                    }
                  },
                ),
                isSaving
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () async {
                          final formState = _formKey.currentState;
                          if (formState == null) return;
                          if (formState.validate() == true) {
                            formState.save();
                            print(entered);
                          }
                          _save();
                        },
                        child: const Text("Save"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    try {
      setState(() {
        isSaving = true;
      });

      ref.read(dataServiceProvider).addTeacher(Teacher.fromMap(entered));
      Navigator.of(context).pop(true);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        isSaving = false;
      });
    }
  }
}
