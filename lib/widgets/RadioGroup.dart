import 'package:flutter/material.dart';

typedef OnRadioGroupValueChangeCallBack = Function(String);

class RadioGroup extends StatefulWidget {
  final List<String> items;
  final String value;
  final double space;
  final TextStyle labelStyle;
  final OnRadioGroupValueChangeCallBack onSelectedValueChange;

  RadioGroup({
    Key key,
    this.space = 10.0,
    this.items,
    this.labelStyle,
    this.onSelectedValueChange,
    @required this.value,
  })  : assert(space > 0),
        assert(value != null),
        assert(
          items == null ||
              items.isEmpty ||
              value == null ||
              items.where((String item) {
                    return item == value;
                  }).length ==
                  1,
          'There should be exactly one item with [RadioGroup]\'s value: '
          '$value. \n'
          'Either zero or 2 or more [RadioGroup]s were detected '
          'with the same value',
        ),
        super(key: key);

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  String _selectedValue;

  Widget _buildRadio(String item) {
    return Radio<String>(
      groupValue: _selectedValue,
      value: item,
      onChanged: _onSelectedValueChange,
    );
  }

  void _onSelectedValueChange(String value) {
    setState(() {
      _selectedValue = value;
      widget.onSelectedValueChange(_selectedValue);
    });
  }

  Widget _buildLabel(String item) {
    final _labelStyle = widget.labelStyle ??
        TextStyle(
          color: Colors.black,
        );

    return Text(
      item,
      style: _labelStyle,
    );
  }

  List<Widget> get _radios {
    final groupValue = widget.items ?? [];
    if (groupValue.isEmpty) return [];

    List<Widget> listView = [];
    Widget space = Container(
      width: widget.space,
    );

    groupValue.asMap().forEach((index, value) =>
        listView..add(_buildRadio(value))..add(_buildLabel(value))..add(space));

    return listView;
  }

  @override
  void initState() {
    _selectedValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _radios,
      ),
    );
  }
}
