import 'package:climbing_vision/src/models/climbs.dart';
import 'package:flutter/material.dart';
import '../bottomBar.dart';


class FoundScreen extends StatefulWidget {

  const FoundScreen({
    Key key,
  }) : super(key: key);

  @override
  FoundScreenState createState() => FoundScreenState();
}

class FoundScreenState extends State<FoundScreen>{

  //List<Climb> _data = generateItems(8);
  List<Climb> _data = climbList();

  @override
  void initState(){
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('Found'),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }

Widget _buildPanel() {
  return ExpansionPanelList(
    expansionCallback: (int index, bool isExpanded) {
      setState(() {
        _data[index].isExpanded = !isExpanded;
      });
    },
    children: _data.map<ExpansionPanel>((Climb climb){
      return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text(climb.headerValue),
          );
        },
        body: ListTile(
          title: Text(climb.expandedValue),
          //subtitle: Text('To delete this panel, tap the trash icon'),
          trailing: Icon(Icons.delete),
          onTap: () {
            setState(() {
              _data.removeWhere((currentClimb) => climb == currentClimb);
            });
          },
        ),
        isExpanded: climb.isExpanded,
      );
    }).toList(),
  );
}

}

