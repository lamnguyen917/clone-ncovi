import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Label.dart';
import 'PickerSelect.dart';

class NationalityPickerSelect extends StatelessWidget {
  final OnPickerSelectValueChangeCallBack onSelectedValueChange;

  const NationalityPickerSelect({
    Key key,
    @required this.onSelectedValueChange,
  }) : super(key: key);

  // TODO fix with multi language text
  final String chooseNationalityTitle = 'Choose your nationality';

  Future<List<String>> _getListNationalities() async {
    final path = 'assets/jsons/en_country.json';
    final jsonString = await rootBundle.loadString(path);
    final jsonData = await jsonDecode(jsonString) as List<dynamic>;

    List<String> data = <String>[];

    jsonData.forEach((item) {
      if (item is Map<String, dynamic>) {
        final name = item['name'] ?? 'Unknown';

        // TODO fix hardcode
        if (name == 'Viet Nam') {
          data.insert(0, name);
        } else {
          data.add(name);
        }
      }
    });

    return data;
  }

  List<String> _getSelectPickerItem(List<String> data) {
    List<String> result = <String>[];

    data.forEach(
      (item) {
        result.add(item);
      },
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    Widget loading = Container(
      height: 20,
      child: CircularProgressIndicator(),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Label(
          labelText: chooseNationalityTitle,
        ),
        FutureBuilder<List<String>>(
          future: _getListNationalities(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Container(
                  child: Text(
                      'Something went wrong: ${snapshot.error.toString()}'),
                );
              }
              return PickerSelect(
                items: _getSelectPickerItem(snapshot.data),
                onSelectedValueChange: onSelectedValueChange,
              );
            } else {
              return loading;
            }
          },
        ),
      ],
    );
  }
}
