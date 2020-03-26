import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final CameraPosition _initPosition = CameraPosition(
    target: LatLng(21.0173932, 105.7699858),
    zoom: 15.0,
  );

  void _onMapCreated(MapboxMapController controller) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: MapboxMap(
        initialCameraPosition: _initPosition,
        onMapCreated: _onMapCreated,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
          Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
        ].toSet(),
      ),
    );
  }
}
