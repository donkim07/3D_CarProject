import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class ModelCacheService {
  static final ModelCacheService _instance = ModelCacheService._internal();
  final Map<String, String> _cache = {};
  
  factory ModelCacheService() {
    return _instance;
  }

  ModelCacheService._internal();

  Future<String> getCachedModelPath(String modelName) async {
    // Check if the model path is already in memory cache
    if (_cache.containsKey(modelName)) {
      return _cache[modelName]!;
    }

    // Get the application documents directory
    final directory = await getApplicationDocumentsDirectory();
    final modelPath = '${directory.path}/models/$modelName';

    // Check if the file exists in the local storage
    if (await File(modelPath).exists()) {
      _cache[modelName] = modelPath;
      return modelPath;
    }

    return '';
  }

  Future<String> cacheModel(String url, String modelName) async {
    try {
      // Get the application documents directory
      final directory = await getApplicationDocumentsDirectory();
      final modelDirectory = Directory('${directory.path}/models');
      
      // Create the models directory if it doesn't exist
      if (!await modelDirectory.exists()) {
        await modelDirectory.create(recursive: true);
      }

      final modelPath = '${modelDirectory.path}/$modelName';
      final modelFile = File(modelPath);

      // Download and save the model if it doesn't exist
      if (!await modelFile.exists()) {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          await modelFile.writeAsBytes(response.bodyBytes);
        } else {
          throw Exception('Failed to download model');
        }
      }

      // Cache the model path in memory
      _cache[modelName] = modelPath;
      return modelPath;
    } catch (e) {
      print('Error caching model: $e');
      return '';
    }
  }

  Future<void> clearCache() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final modelDirectory = Directory('${directory.path}/models');
      
      if (await modelDirectory.exists()) {
        await modelDirectory.delete(recursive: true);
      }
      
      _cache.clear();
    } catch (e) {
      print('Error clearing cache: $e');
    }
  }

  bool isModelCached(String modelName) {
    return _cache.containsKey(modelName);
  }
}
