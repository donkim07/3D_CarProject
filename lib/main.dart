import 'package:flutter/material.dart';
import 'package:flutter_3d/startup.dart';
import 'package:flutter_3d/services/database_service.dart';
import 'package:flutter_3d/services/model_cache_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize database
  await DatabaseService.instance.initialize();
  
  // Initialize model cache service
  final modelCache = ModelCacheService();

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
