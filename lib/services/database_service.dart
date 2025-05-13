import 'package:mysql1/mysql1.dart';

class DatabaseService {
  static DatabaseService? _instance;
  late MySqlConnection? _connection;

  DatabaseService._();

  static DatabaseService get instance {
    _instance ??= DatabaseService._();
    return _instance!;
  }

  Future<MySqlConnection> get connection async {
    if (_connection == null) {
      _connection = await _connect();
    }
    return _connection!;
  }

  Future<MySqlConnection> _connect() async {
    final settings = ConnectionSettings(
      host: 'localhost', 
      port: 3306,
      user: 'root',
      password: '',
      db: 'flutter_cars',
    );

    try {
      final conn = await MySqlConnection.connect(settings);
      print('Database connected successfully');
      return conn;
    } catch (e) {
      print('Database connection failed: $e');
      rethrow;
    }
  }

  Future<void> initialize() async {
    final conn = await connection;
    
    // Create tables if they don't exist
    await conn.query('''
      CREATE TABLE IF NOT EXISTS students (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL UNIQUE,
        password VARCHAR(255) NOT NULL
      )
    ''');

    await conn.query('''
      CREATE TABLE IF NOT EXISTS lecturers (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL UNIQUE,
        password VARCHAR(255) NOT NULL
      )
    ''');

    await conn.query('''
      CREATE TABLE IF NOT EXISTS models (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        file_path VARCHAR(255) NOT NULL,
        description TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    await conn.query('''
      CREATE TABLE IF NOT EXISTS feedback (
        id INT AUTO_INCREMENT PRIMARY KEY,
        student_id INT,
        content TEXT NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (student_id) REFERENCES students(id)
      )
    ''');
  }

  Future<void> close() async {
    await _connection?.close();
    _connection = null;
  }
}
