import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Function onTap;

  const Link({
    Key key,
    this.text = 'Link',
    this.textStyle,
    this.onTap,
  })  : assert(text != null),
        assert(text != ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textStyle =
        textStyle ?? TextStyle(color: Theme.of(context).accentColor);

    return GestureDetector(
      onTap: onTap,
      child: Text(
        text.trim().isNotEmpty ? text : 'Link',
        style: _textStyle,
      ),
    );
  }
}
