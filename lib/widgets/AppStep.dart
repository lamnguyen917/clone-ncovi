import 'package:flutter/material.dart';

class AppStep extends StatelessWidget {
  final double height;
  final String stepIndicator;
  final String stepTitle;

  const AppStep({
    Key key,
    this.height = 40,
    this.stepIndicator = '1',
    this.stepTitle = 'Step 1',
  })  : assert(stepIndicator != null),
        assert(stepTitle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      color: Theme.of(context).accentColor,
    );

    return ListTile(
      leading: CircleAvatar(
        radius: height / 2,
        child: Text(stepIndicator),
      ),
      title: Text(
        stepTitle,
        style: titleStyle,
      ),
    );
  }
}
