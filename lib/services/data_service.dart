import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/modals/teacher.dart';
import 'package:http/http.dart' as http;

class DataService {
  final String baseUrl = 'https://6457aca30c15cb14820e207d.mockapi.io/';

  Future<Teacher> teacherDownload() async {
    final response = await http.get(Uri.parse('$baseUrl/teacher/1'));

    if (response.statusCode == 200) {
      return Teacher.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Teacher ${response.statusCode}');
    }
  }
}

final dataServiceProvider = Provider((ref) {
  return DataService();
});
