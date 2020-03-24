import 'package:flutter/material.dart';

BoxDecoration decorationBackgroundNone() => new BoxDecoration(
      borderRadius: new BorderRadius.all(Radius.circular(5)),
      border: new Border.all(color: Colors.indigo, width: 1),
    );

BoxDecoration decorationBackground() => new BoxDecoration(
    borderRadius: new BorderRadius.all(Radius.circular(5)),
    border: new Border.all(color: Colors.indigo, width: 1),
    color: Colors.indigo);
