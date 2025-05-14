import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../services/model_cache_service.dart';

class CachedModelViewer extends StatefulWidget {
  final String modelName;
  final bool autoRotate;
  final bool cameraControls;
  final String alt;
  final String? scale;
  
  const CachedModelViewer({
    Key? key,
    required this.modelName,
    this.autoRotate = false,
    this.cameraControls = true,
    this.alt = "A 3D model",
    this.scale,
  }) : super(key: key);

  @override
  State<CachedModelViewer> createState() => _CachedModelViewerState();
}

class _CachedModelViewerState extends State<CachedModelViewer> {
  final ModelCacheService _cacheService = ModelCacheService();
  bool _isAnimationPaused = false;
  bool _isLongPress = false;
  String? _modelPath;

  @override
  void initState() {
    super.initState();
    _initializeModel();
  }

  Future<void> _initializeModel() async {
    final path = await _cacheService.getCachedModelPath(widget.modelName);
    if (mounted) {
      setState(() {
        _modelPath = path;
      });
    }
  }

  void _toggleAnimation() {
    if (!_isLongPress) {
      setState(() {
        _isAnimationPaused = !_isAnimationPaused;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_modelPath == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: _toggleAnimation,
      onLongPressStart: (_) => setState(() => _isLongPress = true),
      onLongPressEnd: (_) => setState(() => _isLongPress = false),
      child: ModelViewer(
        src: _modelPath!,
        alt: widget.alt,
        autoRotate: widget.autoRotate && !_isAnimationPaused,
        cameraControls: widget.cameraControls,
        autoPlay: !_isAnimationPaused,
        scale: widget.scale,
      ),
    );
  }
}
