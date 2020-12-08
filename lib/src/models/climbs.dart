import 'package:flutter/material.dart';

class Climb{
  Climb({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Climb> generateItems(int numberOfItems){
  return List.generate(numberOfItems, (int index) {
    return Climb(
      headerValue: 'Panel $index',
      //expandedValue: 'This is item number $index',
    );
  });
}

List<Climb> climbList(){
  List<Climb> list = new List();
  List<ListTile> climbs = new List();

  climbs.add(ListTile(
    title: Text('Bates Arete Boulder'),
  ));
  climbs.add(ListTile(
    title: Text('Cave Boulder'),
  ));

  list.add(
    Climb(
      headerValue: 'Castle Rock Loop',
      
      expandedValue: 'Bates Arete Boulder'));
  list.add(
    Climb(
      headerValue: 'Castle Rock Area Boulders',
      expandedValue: 'Funny Face Rock'));
  list.add(
    Climb(
      headerValue: 'Castle Rock Loop',
      expandedValue: 'Mumbo Jumbo'
    ));

  return list;
}