import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../bottomBar.dart';


class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746);

  Widget searchMap(){
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: _cameraPosition,
      onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Search")),
      bottomNavigationBar: BottomNavBar(),
      body: ListView(
        children: [
        Container(
          height: 250,
          child: Card(
            child: searchMap(),
          ),
        ),
        SizedBox(
          height: 10,
          ),
        Card(
          child: TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              labelText: 'Search',
            ),
          ),
        ),
          
        ],
      ),
    );
  }
}