import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import '../bottomBar.dart';

class PictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const PictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  PictureScreenState createState() => PictureScreenState();
}

class PictureScreenState extends State<PictureScreen>{
  CameraController _controller;
  Future<void> _initControllerFuture;

  @override
  void initState(){
    super.initState();

    _controller = CameraController(
      widget.camera, 
      ResolutionPreset.ultraHigh,
      );

      _initControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo"),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: FutureBuilder<void>(
      future: _initControllerFuture,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return CameraPreview(_controller);
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.camera_alt),

      onPressed: () async{
        try{
          await _initControllerFuture;

          final path = join(
            (await getTemporaryDirectory()).path,
            '${DateTime.now()}.png',
          );

          await _controller.takePicture(path);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DisplayPictureScreen(imagePath: path),
            ),
          );
        } catch(e){
          print("Here: $e");
        }
      },
    ),
    ); 
    
    
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}