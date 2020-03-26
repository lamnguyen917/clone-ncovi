import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/widgets/HyperlinkButton.dart';
import 'package:flutter_app_ncovi/widgets/MapWidget.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "Warning areas of epidemic",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            HyperlinkButton(
              title: "See details",
              url: "https://www.google.com/",
            ),
          ],
        ),
        MapWidget(),
      ],
    );
  }
}
