import 'package:flutter/material.dart';

typedef OnPickerSelectValueChangeCallBack = Function(String);

class PickerSelect extends StatefulWidget {
  final List<String> items;
  final int initialIndex;
  final TextStyle dropdownLabelStyle;
  final String value;
  final OnPickerSelectValueChangeCallBack onSelectedValueChange;

  const PickerSelect({
    Key key,
    @required this.items,
    this.value,
    this.initialIndex = 0,
    this.dropdownLabelStyle,
    @required this.onSelectedValueChange,
  })  : assert(initialIndex < items.length),
        super(key: key);

  @override
  _PickerSelectState createState() => _PickerSelectState();
}

class _PickerSelectState extends State<PickerSelect> {
  String _selectedItem;

  Widget _buildLabel(String item) {
    final _dropdownLabelStyle = widget.dropdownLabelStyle ??
        TextStyle(
          color: Colors.black,
        );

    return Text(
      item,
      style: _dropdownLabelStyle,
    );
  }

  List<DropdownMenuItem<String>> _createListDropdownMenuItem(
      List<String> list) {
    final _list = list ?? [];

    if (_list.isEmpty) return <DropdownMenuItem<String>>[];

    return _list.map<DropdownMenuItem<String>>((String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: _buildLabel(item),
      );
    }).toList();
  }

  void _onValueChanged(String value) {
    if (value == _selectedItem) return;
    _selectedItem = value;
    widget.onSelectedValueChange(_selectedItem);
  }

  @override
  void initState() {
    _selectedItem = widget.value ?? widget.items[widget.initialIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _items = _createListDropdownMenuItem(widget.items);
    final _value = widget.value ?? widget.items[widget.initialIndex];

    return DropdownButton<String>(
      isExpanded: true,
      value: _value,
      icon: Icon(Icons.arrow_drop_down),
      items: _items,
      onChanged: _onValueChanged,
    );
  }
}
