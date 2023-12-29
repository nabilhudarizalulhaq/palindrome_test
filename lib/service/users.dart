import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_suitemedia/models/model.dart';

class UserService {
  static const String _baseUrl = 'https://reqres.in/api';
  static Future<List<Users>> fetchUsers() async {
    try {
      final respons = await http.get( Uri.parse('$_baseUrl/users?page=1&per_page=10'));
      final body = respons.body;
      final result = jsonDecode(body);
      List<Users> users = List<Users>.from(
        result['data'].map(
          (user) => Users.fromJson(user),
        ),
      );
      return users;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
