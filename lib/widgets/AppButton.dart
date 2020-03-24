import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool isExpand;
  final VoidCallback onPressed;

  const AppButton({
    Key key,
    @required this.title,
    this.isExpand = false,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).accentColor;
    final textStyle = TextStyle(
      color: Colors.white,
    );

    return Container(
      width: isExpand ? double.infinity : null,
      child: RaisedButton(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        color: accentColor,
        child: Text(
          title.toUpperCase(),
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
