import 'package:flutter/material.dart';
import 'MapView.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            height: 500,
            color: Colors.accents[0],
            child: Center(
              child: Text("Keep for infotmations"),
            ),
          ),
          MapView(),
        ],
      ),
    );
  }
}
