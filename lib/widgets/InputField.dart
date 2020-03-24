import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/widgets/Label.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final String initialValue;
  final Function onSaved;
  final Function onFieldSubmitted;
  final TextEditingController controller;
  final TextStyle hintStyle;
  final TextStyle textStyle;

  const InputField({
    Key key,
    this.hintText = '',
    this.keyboardType,
    this.focusNode,
    this.textInputAction,
    this.initialValue,
    this.onSaved,
    this.onFieldSubmitted,
    this.controller,
    this.hintStyle,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _hintStyle = hintStyle ??
        TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        );

    final _textStyle = textStyle ??
        TextStyle(
          fontWeight: FontWeight.bold,
        );

    return TextFormField(
      decoration: InputDecoration(
        hintStyle: _hintStyle,
        hintText: hintText,
      ),
      style: _textStyle,
      keyboardType: keyboardType,
      focusNode: focusNode,
      textInputAction: textInputAction,
      initialValue: initialValue,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
    );
  }
}
