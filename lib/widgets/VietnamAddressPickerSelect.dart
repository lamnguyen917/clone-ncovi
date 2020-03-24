import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'PickerSelect.dart';

class VietnamAddressPickerSelect extends StatefulWidget {
  final OnPickerSelectValueChangeCallBack onSelectedProvinceOrCityChange;
  final OnPickerSelectValueChangeCallBack onSelectedDistrictChange;
  final OnPickerSelectValueChangeCallBack onSelectedCommuneOrWardChange;

  const VietnamAddressPickerSelect({
    Key key,
    @required this.onSelectedProvinceOrCityChange,
    @required this.onSelectedDistrictChange,
    @required this.onSelectedCommuneOrWardChange,
  }) : super(key: key);

  @override
  _VietnamAddressPickerSelectState createState() =>
      _VietnamAddressPickerSelectState();
}

class _VietnamAddressPickerSelectState
    extends State<VietnamAddressPickerSelect> {
  final StreamController<List<_ProvinceOrCity>>
      _provinceOrCityStreamController = StreamController();
  final StreamController<List<_District>> _districtStreamController =
      StreamController();
  final StreamController<List<_CommuneOrWard>> _communeOrWardStreamController =
      StreamController();

  // TODO fix with multi language text
  final String _selectProvinceOrCity = 'Select Province/ City';
  final String _selectDistrict = 'Select District';
  final String _selectCommuneOrWard = 'Select Commune/ Ward';

  _ProvinceOrCity get _initProvinceOrCity => _ProvinceOrCity(
        code: "-1",
        name: _selectProvinceOrCity,
      );

  _District get _initDistrict => _District(
        code: "-1",
        name: _selectDistrict,
      );

  _CommuneOrWard get _initCommuneOrWard => _CommuneOrWard(
        code: "-1",
        name: _selectCommuneOrWard,
      );

  _ProvinceOrCity _provinceOrCity;
  _District _district;
  _CommuneOrWard _communeOrWard;

  Future<List<_ProvinceOrCity>> _getListProvinceOrCity() async {
    final path = 'assets/jsons/province_city.json';
    final jsonString = await rootBundle.loadString(path);
    final jsonData = await jsonDecode(jsonString) as Map<String, dynamic>;

    List<_ProvinceOrCity> data = <_ProvinceOrCity>[];

    jsonData.forEach((key, value) {
      if (key is String && value is Map<String, dynamic>) {
        data.add(
          _ProvinceOrCity(
            code: key,
            name: value['name'] ?? 'Unknown',
          ),
        );
      }
    });

    data.insert(0, _initProvinceOrCity);
    return data;
  }

  Future<List<_District>> _getListDistrict(String provinceOrCityCode) async {
    final path = 'assets/jsons/district.json';
    final jsonString = await rootBundle.loadString(path);
    final jsonData = await jsonDecode(jsonString) as Map<String, dynamic>;

    List<_District> data = <_District>[];

    jsonData.forEach((key, value) {
      if (key is String && value is Map<String, dynamic>) {
        if (value['parent_code'] == provinceOrCityCode) {
          data.add(
            _District(
              code: key,
              name: value['name'] ?? 'Unknown',
            ),
          );
        }
      }
    });

    data.insert(0, _initDistrict);
    return data;
  }

  Future<List<_CommuneOrWard>> _getListCommuneAndWard(
      String districtCode) async {
    final path = 'assets/jsons/commune_ward.json';
    final jsonString = await rootBundle.loadString(path);
    final jsonData = await jsonDecode(jsonString) as Map<String, dynamic>;

    List<_CommuneOrWard> data = <_CommuneOrWard>[];

    jsonData.forEach((key, value) {
      if (key is String && value is Map<String, dynamic>) {
        if (value['parent_code'] == districtCode) {
          data.add(
            _CommuneOrWard(
              code: key,
              name: value['name'] ?? 'Unknown',
            ),
          );
        }
      }
    });

    data.insert(0, _initCommuneOrWard);
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

  void _onSelectedProvinceOrCityChange(_ProvinceOrCity item) async {
    _resetProvinceAndCityList(item);

    if (_initProvinceOrCity.equalAllProperties(_provinceOrCity)) return;
    await _setListDistrict();
  }

  void _resetProvinceAndCityList(_ProvinceOrCity item) {
    _districtStreamController.add([_initDistrict]);
    _communeOrWardStreamController.add([_initCommuneOrWard]);

    setState(() {
      _provinceOrCity = item;
      _district = _initDistrict;
      _communeOrWard = _initCommuneOrWard;
      widget.onSelectedProvinceOrCityChange(_provinceOrCity.name);
    });
  }

  Future _setListDistrict() async {
    final nextData = await _getListDistrict(_provinceOrCity.code);
    _districtStreamController.add(nextData);
  }

  void _onSelectedDistrictChange(_District item) async {
    _resetDistrictList(item);

    if (_initDistrict.equalAllProperties(_district)) return;
    await _setCommuneAndWard();
  }

  void _resetDistrictList(_District item) {
    _communeOrWardStreamController.add([_initCommuneOrWard]);

    setState(() {
      _district = item;
      _communeOrWard = _initCommuneOrWard;
      widget.onSelectedDistrictChange(_district.name);
    });
  }

  Future _setCommuneAndWard() async {
    final nextData = await _getListCommuneAndWard(_district.code);
    _communeOrWardStreamController.add(nextData);
  }

  void _onSelectedCommuneOrWardChange(_CommuneOrWard item) {
    _resetCommuneAndWardList(item);
  }

  void _resetCommuneAndWardList(_CommuneOrWard item) {
    setState(() {
      _communeOrWard = item;
      widget.onSelectedCommuneOrWardChange(_communeOrWard.name);
    });
  }

  Widget _buildErrorWidget(String message) => Container(
        child: Text('Something went wrong: $message'),
      );

  @override
  void initState() {
    _provinceOrCity = _initProvinceOrCity;
    _district = _initDistrict;
    _communeOrWard = _initCommuneOrWard;

    _getListProvinceOrCity().then((list) {
      _provinceOrCityStreamController.add(list);
    });

    super.initState();
  }

  @override
  void dispose() {
    _provinceOrCityStreamController.close();
    _districtStreamController.close();
    _communeOrWardStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        StreamBuilder<List<_ProvinceOrCity>>(
          initialData: [_initProvinceOrCity],
          stream: _provinceOrCityStreamController.stream,
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error.toString());
            } else {
              final data = snapshot.data;

              final items =
                  _getSelectPickerItem(data.map((item) => item.name).toList());

              getProvinceOrCityWithName(String name) {
                return data.firstWhere((item) => item.name == name);
              }

              return PickerSelect(
                items: items,
                value: _provinceOrCity.name,
                onSelectedValueChange: (value) =>
                    _onSelectedProvinceOrCityChange(
                        getProvinceOrCityWithName(value)),
              );
            }
          },
        ),
        StreamBuilder<List<_District>>(
          initialData: [_initDistrict],
          stream: _districtStreamController.stream,
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error.toString());
            } else {
              final data = snapshot.data;

              final items =
                  _getSelectPickerItem(data.map((item) => item.name).toList());

              getDistrict(String name) {
                return data.firstWhere((item) => item.name == name);
              }

              return PickerSelect(
                items: items,
                value: _district.name,
                onSelectedValueChange: (value) =>
                    _onSelectedDistrictChange(getDistrict(value)),
              );
            }
          },
        ),
        StreamBuilder<List<_CommuneOrWard>>(
          initialData: [_initCommuneOrWard],
          stream: _communeOrWardStreamController.stream,
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error.toString());
            } else {
              final data = snapshot.data;

              final items =
                  _getSelectPickerItem(data.map((item) => item.name).toList());

              getCommuneOrWardC(String name) {
                return data.firstWhere((item) => item.name == name);
              }

              return PickerSelect(
                items: items,
                value: _communeOrWard.name,
                onSelectedValueChange: (value) =>
                    _onSelectedCommuneOrWardChange(getCommuneOrWardC(value)),
              );
            }
          },
        ),
      ],
    );
  }
}

class _CommonLocation {
  final String code;
  final String name;

  _CommonLocation({
    this.code,
    this.name,
  });

  bool equalAllProperties(_CommonLocation other) {
    return (this.code == other.code && this.name == other.name);
  }
}

class _ProvinceOrCity extends _CommonLocation {
  _ProvinceOrCity({
    String code,
    String name,
  }) : super(code: code, name: name);
}

class _District extends _CommonLocation {
  _District({
    String code,
    String name,
  }) : super(code: code, name: name);
}

class _CommuneOrWard extends _CommonLocation {
  _CommuneOrWard({
    String code,
    String name,
  }) : super(code: code, name: name);
}
