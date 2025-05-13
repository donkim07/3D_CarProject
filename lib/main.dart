import 'package:flutter/material.dart';
import 'package:flutter_3d/startup.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('student');
  await Hive.initFlutter();
  await Hive.openBox('student-email');
  await Hive.initFlutter();
  await Hive.openBox('student-password');
  await Hive.initFlutter();
  await Hive.openBox('lecturer');
  await Hive.initFlutter();
  await Hive.openBox('lecturer-email');
  await Hive.initFlutter();
  await Hive.openBox('lecturer-password');
  await Hive.initFlutter();
  await Hive.openBox('lessons');
  await Hive.initFlutter();
  await Hive.openBox('showlesson');
  await Hive.initFlutter();
  await Hive.openBox('showlesson2');
  await Hive.initFlutter();
  await Hive.openBox('feedback');
  await Hive.initFlutter();
  await Hive.openBox('storedstudent');
  await Hive.initFlutter();
  await Hive.openBox('namedfeedback');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 3D',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: startup(),
    );
  }
}
