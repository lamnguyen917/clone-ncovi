import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/widgets/MapWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.accents[0],
          ),
          Container(
            height: 100,
            color: Colors.accents[1],
          ),
          Container(
            height: 100,
            color: Colors.accents[2],
          ),
          Container(
            height: width,
            child: MapWidget(),
          )
        ],
      ),
    );
  }
}
