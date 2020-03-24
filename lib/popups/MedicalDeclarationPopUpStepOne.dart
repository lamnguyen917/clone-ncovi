import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_ncovi/popups/MedicalDeclarationPopUpStepTwo.dart';
import 'package:flutter_app_ncovi/popups/MedicalDeclarationPopUpViewModel.dart';
import 'package:flutter_app_ncovi/widgets/AppButton.dart';
import 'package:flutter_app_ncovi/widgets/AppStep.dart';
import 'package:flutter_app_ncovi/widgets/InputField.dart';
import 'package:flutter_app_ncovi/widgets/Label.dart';
import 'package:flutter_app_ncovi/widgets/Link.dart';
import 'package:flutter_app_ncovi/widgets/MainAppBar.dart';
import 'package:flutter_app_ncovi/widgets/NationalityPickerSelect.dart';
import 'package:flutter_app_ncovi/widgets/RadioGroup.dart';
import 'package:flutter_app_ncovi/widgets/VietnamAddressPickerSelect.dart';
import 'package:provider/provider.dart';

enum _GENDER {
  MALE,
  FEMALE,
}

String _getGenderLabel(_GENDER gender) {
  switch (gender) {
    case _GENDER.MALE:
      return 'Male';
    case _GENDER.FEMALE:
      // TODO: Handle this case.
      return 'Female';
    default:
      {
        return 'Other';
      }
  }
}

class MedicalDeclarationPopUpStepOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO fix with multi language text
    String titleText = 'Thong tin khai bao y te tu nguyen';
    String individualTabText = 'Individual';
    String relativesTabText = 'Relatives';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFF1F5F4),
        appBar: MainAppBar(
          context: context,
          titleText: titleText,
          tabTitles: [
            individualTabText,
            relativesTabText,
          ],
        ),
        body: ChangeNotifierProvider<MedicalDeclarationPopUpViewModel>.value(
          value: MedicalDeclarationPopUpViewModel(),
          child: TabBarView(
            children: <Widget>[
              _DeclarationPopUpContent(),
              _DeclarationPopUpContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DeclarationPopUpContent extends StatefulWidget {
  @override
  __DeclarationPopUpContentState createState() =>
      __DeclarationPopUpContentState();
}

class __DeclarationPopUpContentState extends State<_DeclarationPopUpContent>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isInit = true;
  MedicalDeclarationPopUpViewModel _viewModel;

  final _passportFocus = FocusNode();
  final _socialInsuranceFocus = FocusNode();
  final _dOBFocus = FocusNode();
  final _houseNumberFocus = FocusNode();
  final _phoneNumberFocus = FocusNode();
  final _emailFocus = FocusNode();

//  final _fullNameController = TextEditingController();
//  final _emailController = TextEditingController();
//  final _passwordController = TextEditingController();

  void _showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(snackBar);
  }

  void _goToStepTwo() {
    showDialog(
        context: context, builder: (_) => MedicalDeclarationPopUpStepTwo());
  }

  void _lookUpSocialInsuranceNumber() {
    _showSnackBar("look up social insurance number");
  }

  void _onNationalitySelected(String data) {
    print(data);
  }

  void _onProvinceOrCitySelected(String data) {
    print(data);
  }

  void _onDistrictSelected(String data) {
    print(data);
  }

  void _onCommuneOrWardSelected(String data) {
    print(data);
  }

  void _continue() {
    _goToStepTwo();
  }

  @override
  void didChangeDependencies() {
    if (!_isInit) return;
    _viewModel =
        Provider.of<MedicalDeclarationPopUpViewModel>(context, listen: false);
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // TODO fix with multi language text
    String stepTitle = 'Khai bao thong tin Ca nhan';
    String fullNameTitle = 'Full name';
    String fullNameHint = 'Enter Full name';
    String passportTitle = 'Passport number';
    String passportHint = 'Enter passport';
    String socialInsuranceNumberTitle = 'social Insurance';
    String socialInsuranceNumberLegend = 'social Insurance legend';
    String socialInsuranceNumberHint = 'social InsuranceNumber Hint';
    String lookUpSocialInsuranceNumberTitle =
        'look Up Social Insurance Number Title';
    String dOBTitle = 'Date Of Birth';
    String genderTitle = 'Gender';
    String chooseVietnamAddressTitle = 'choose vietnam address title';
    String houseNumberHint = 'house number hint';
    String phoneNumberTitle = 'phone number title';
    String phoneNumberHint = 'phone number hint';
    String emailTitle = 'email title';
    String emailHint = 'email hint';
    String continueButtonTitle = 'continue';

    List<String> radioGroupItems = [];
    _GENDER.values.asMap().forEach((index, item) {
      radioGroupItems.add(_getGenderLabel(item));
    });

    final divider = Divider(
      height: 30,
    );

    final legendStyle = TextStyle(
      fontSize: 12,
    );

    final numberKeyboardType = TextInputType.numberWithOptions(decimal: false);
    final decimalNumberKeyboardType =
        TextInputType.numberWithOptions(decimal: true);

    final dateTimeKeyboardType = TextInputType.datetime;
    final phoneKeyboardType = TextInputType.phone;
    final emailKeyboardType = TextInputType.emailAddress;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppStep(
                stepIndicator: '1',
                stepTitle: stepTitle,
              ),
              SizedBox(
                height: 10,
              ),
              Label(
                labelText: fullNameTitle,
                isRequired: true,
              ),
              InputField(
                hintText: fullNameHint,
              ),
              divider,
              Label(
                labelText: passportTitle,
                isRequired: true,
              ),
              InputField(
                hintText: passportHint,
                keyboardType: numberKeyboardType,
              ),
              divider,
              Label(
                labelText: socialInsuranceNumberTitle,
              ),
              Text(
                socialInsuranceNumberLegend,
                style: legendStyle,
              ),
              InputField(
                hintText: socialInsuranceNumberHint,
                keyboardType: numberKeyboardType,
              ),
              Link(
                text: lookUpSocialInsuranceNumberTitle,
                onTap: _lookUpSocialInsuranceNumber,
              ),
              divider,
              Label(
                labelText: dOBTitle,
                isRequired: true,
              ),
//              InputField(
//                initialValue: 'DD/MM/YYYY',
//                keyboardType: Platform.isAndroid
//                    ? dateTimeKeyboardType
//                    : decimalNumberKeyboardType,
//              ),
              RaisedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ).then((DateTime value) {
                    print('DateTime: ${value.toIso8601String()}');
                  });
                },
                child: Container(
                  height: 15,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
              divider,
              Label(
                labelText: genderTitle,
                isRequired: true,
              ),
              RadioGroup(
                items: radioGroupItems,
                value: radioGroupItems[0],
                onSelectedValueChange: (gender) {
                  print(gender);
                },
              ),
              NationalityPickerSelect(
                onSelectedValueChange: _onNationalitySelected,
              ),
              divider,
              Label(
                labelText: chooseVietnamAddressTitle,
              ),
              VietnamAddressPickerSelect(
                onSelectedProvinceOrCityChange: _onProvinceOrCitySelected,
                onSelectedDistrictChange: (String item) {
                  _onDistrictSelected(item);
                },
                onSelectedCommuneOrWardChange: _onCommuneOrWardSelected,
              ),
              InputField(
                hintText: houseNumberHint,
              ),
              divider,
              Label(
                labelText: phoneNumberTitle,
                isRequired: true,
              ),
              InputField(
                keyboardType: phoneKeyboardType,
                hintText: phoneNumberHint,
              ),
              divider,
              Label(
                labelText: emailTitle,
              ),
              InputField(
                keyboardType: emailKeyboardType,
                hintText: emailHint,
              ),
              divider,
              AppButton(
                isExpand: true,
                title: continueButtonTitle,
                onPressed: _continue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
