import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class EnhancedModelViewer extends StatefulWidget {
  final String modelName;
  final bool autoRotate;
  final bool cameraControls;
  final String alt;
  final String? scale;
  
  const EnhancedModelViewer({
    Key? key,
    required this.modelName,
    this.autoRotate = false,
    this.cameraControls = true,
    this.alt = "A 3D model",
    this.scale,
  }) : super(key: key);

  @override
  State<EnhancedModelViewer> createState() => _EnhancedModelViewerState();
}

class _EnhancedModelViewerState extends State<EnhancedModelViewer> {
  bool _isAnimationPaused = false;
  bool _isLongPress = false;

  void _toggleAnimation() {
    if (!_isLongPress) {
      setState(() {
        _isAnimationPaused = !_isAnimationPaused;
      });
    }
  }

  String get _getModelPath => 'assets/models/${widget.modelName}';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleAnimation,
      onLongPressStart: (_) => setState(() => _isLongPress = true),
      onLongPressEnd: (_) => setState(() => _isLongPress = false),
      child: ModelViewer(
        src: _getModelPath,
        alt: widget.alt,
        autoRotate: widget.autoRotate && !_isAnimationPaused,
        cameraControls: widget.cameraControls,
        autoPlay: !_isAnimationPaused,
        scale: widget.scale,
      ),
    );
  }
}
