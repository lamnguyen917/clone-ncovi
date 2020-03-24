import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String labelText;
  final bool isRequired;
  final TextStyle labelStyle;

  const Label({
    Key key,
    this.labelText,
    this.isRequired = false,
    this.labelStyle,
  }) : super(key: key);

  Widget get labelWidget {
    final _labelStyle = labelStyle ??
        TextStyle(
          color: Colors.black54,
        );

    final _asteriskStyle = _labelStyle.copyWith(
      color: Colors.red,
    );

    if (isRequired && (labelText != null && labelText.isNotEmpty)) {
      return RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: labelText,
              style: _labelStyle,
            ),
            TextSpan(
              text: ' *',
              style: _asteriskStyle,
            ),
          ],
        ),
      );
    } else {
      final _labelText =
          (labelText == null || labelText.isEmpty) ? '' : labelText;

      return Text(
        _labelText,
        style: _labelStyle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return labelWidget;
  }
}
