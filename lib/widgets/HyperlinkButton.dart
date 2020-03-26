import 'package:flutter/material.dart';
import '../utils/network.dart';

class HyperlinkButton extends StatelessWidget {
  final String title;
  final String url;
  TextStyle style;

  HyperlinkButton({Key key, this.title, this.url, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (style == null) {
      style = new TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
      );
    }
    return FlatButton(
      onPressed: () {
        launchUrl(url);
      },
      child: Text(
        title,
        style: style,
      ),
    );
  }
}
