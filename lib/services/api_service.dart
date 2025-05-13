import 'dart:convert';
import 'package:mysql1/mysql1.dart';
import 'database_service.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  final DatabaseService _db = DatabaseService.instance;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal();

  // Student Methods
  Future<Map<String, dynamic>> createStudent(String name, String email, String password) async {
    final conn = await _db.connection;
    try {
      var result = await conn.query(
        'INSERT INTO students (name, email, password) VALUES (?, ?, ?)',
        [name, email, password]
      );
      
      return {
        'success': true,
        'id': result.insertId,
        'name': name,
        'email': email
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString()
      };
    }
  }

  Future<Map<String, dynamic>> studentLogin(String email, String password) async {
    final conn = await _db.connection;
    try {
      var results = await conn.query(
        'SELECT * FROM students WHERE email = ? AND password = ?',
        [email, password]
      );
      
      if (results.isEmpty) {
        return {
          'success': false,
          'error': 'Invalid credentials'
        };
      }

      var student = results.first;
      return {
        'success': true,
        'id': student['id'],
        'name': student['name'],
        'email': student['email']
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString()
      };
    }
  }

  // Lecturer Methods
  Future<Map<String, dynamic>> createLecturer(String name, String email, String password) async {
    final conn = await _db.connection;
    try {
      var result = await conn.query(
        'INSERT INTO lecturers (name, email, password) VALUES (?, ?, ?)',
        [name, email, password]
      );
      
      return {
        'success': true,
        'id': result.insertId,
        'name': name,
        'email': email
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString()
      };
    }
  }

  Future<Map<String, dynamic>> lecturerLogin(String email, String password) async {
    final conn = await _db.connection;
    try {
      var results = await conn.query(
        'SELECT * FROM lecturers WHERE email = ? AND password = ?',
        [email, password]
      );
      
      if (results.isEmpty) {
        return {
          'success': false,
          'error': 'Invalid credentials'
        };
      }

      var lecturer = results.first;
      return {
        'success': true,
        'id': lecturer['id'],
        'name': lecturer['name'],
        'email': lecturer['email']
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString()
      };
    }
  }

  // 3D Model Methods
  Future<Map<String, dynamic>> addModel(String name, String filePath, String description) async {
    final conn = await _db.connection;
    try {
      var result = await conn.query(
        'INSERT INTO models (name, file_path, description) VALUES (?, ?, ?)',
        [name, filePath, description]
      );
      
      return {
        'success': true,
        'id': result.insertId,
        'name': name,
        'filePath': filePath
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString()
      };
    }
  }

  Future<List<Map<String, dynamic>>> getModels() async {
    final conn = await _db.connection;
    try {
      var results = await conn.query('SELECT * FROM models');
      return results.map((row) => {
        'id': row['id'],
        'name': row['name'],
        'filePath': row['file_path'],
        'description': row['description']
      }).toList();
    } catch (e) {
      return [];
    }
  }

  // Feedback Methods
  Future<Map<String, dynamic>> addFeedback(int studentId, String content) async {
    final conn = await _db.connection;
    try {
      var result = await conn.query(
        'INSERT INTO feedback (student_id, content) VALUES (?, ?)',
        [studentId, content]
      );
      
      return {
        'success': true,
        'id': result.insertId,
        'content': content
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString()
      };
    }
  }
}
