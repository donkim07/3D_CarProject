import 'package:flutter/material.dart';
import 'package:flutter_3d/widgets/enhanced_model_viewer.dart';

class PistonViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      width: 800,
      child: EnhancedModelViewer(
        modelName: 'engine_work_animation.glb',
        alt: "A 3D model of a piston",
        autoRotate: false,
        cameraControls: true,
      ),
    );
  }
}

class V8EngineViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 800,
      child: EnhancedModelViewer(
        modelName: 'animated_engine_v8.glb',
        alt: "A 3D model of a V8 engine",
        autoRotate: false,
        cameraControls: true,
        scale: "5.1 5.1 5.1",
      ),
    );
  }
}

class EngineAssemblyViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 800,
      child: EnhancedModelViewer(
        modelName: 'v8_engine.glb',
        alt: "A 3D model of an engine assembly",
        autoRotate: false,
        cameraControls: true,
        scale: "5.1 5.1 5.1",
      ),
    );
  }
}
