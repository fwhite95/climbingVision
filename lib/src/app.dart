import 'package:climbing_vision/src/pages/foundPage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../src/pages/picturePage.dart';
import '../src/pages/searchPage.dart';

class MyApp extends StatelessWidget {
 final CameraDescription _camera;

  MyApp({Key key, CameraDescription camera})
    : _camera = camera, super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: PictureScreen(
          camera: _camera,
        )
      ),
    );
  }
}