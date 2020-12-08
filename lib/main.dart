import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

Future<void> main() async{

  //ensures that plugin services are initialized before runApp
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

