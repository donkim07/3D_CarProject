class ModelRepository {
  static final ModelRepository _instance = ModelRepository._internal();
  factory ModelRepository() => _instance;
  ModelRepository._internal();

  static ModelRepository get instance => _instance;

  String getModelPath(String modelName) {
    // All models are now in assets
    return 'assets/models/$modelName';
  }

  bool isModelAvailable(String modelName) {
    // All models are available in assets folder
    const availableModels = [
      'animated_engine_v8.glb',
      'engine_work_animation_-_low_poly.glb',
      'v8_engine.glb'
    ];
    return availableModels.contains(modelName);
  }

  Future<List<Map<String, dynamic>>> getAvailableModels() async {
    // Return the list of models from assets
    return [
      {
        'name': 'engine_work_animation.glb',
        'description': 'Engine Animation',
      },
      {
        'name': 'animated_engine_v8.glb',
        'description': 'V8 Engine Animation',
      },
      {
        'name': 'v8_engine.glb',
        'description': 'V8 Engine Model',
      }
    ];  }
}
