import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';
import 'package:flutter_app_ncovi/core/define/Define.dart';
import 'package:flutter_app_ncovi/generated/i18n.dart';
import 'package:flutter_app_ncovi/views/custom/Style.dart';

class FeedBackScreen extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  GenderRadio _genderRadio = GenderRadio.male;
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerBirtday = TextEditingController();
  TextEditingController controllerCMT = TextEditingController();
  String valueCountry = "Việt Nam";
  String valueTinhThanh = "Chọn Tỉnh/Thành";
  String valueLocal = "Chọn Quận/Huyện";
  String valueXaPhuong = "Chọn Xã/Phường";
  List<String> listCountry = [
    "Việt nam",
    "Trung Quốc",
    "Lào",
    "Cambodia",
    "Indonecia",
    "Thailand",
    "Philippin",
    "Bruney",
    "Dongtimo",
    "Myanmar",
    "Japan",
    "South Korea",
    "Nouth Korea"
  ];
  List<String> listTinhThanh = [
    "Hà Nội",
    "Thái Bình",
    "Bắn Ninh",
    "Hà Nam",
    "Ninh Bình",
    "Phú Thọ",
    "Vĩnh Phúc",
    "Hải Dương"
  ];
  List<String> listLocal = [
    "Hoàn Kiếm",
    "Đống đa",
    "Bắc Từ Liêm",
    "Nam từ liêm",
    "Cầu giấy",
    "Ba Đình",
    "Hà Đông",
    "Thanh Xuân"
  ];
  List<String> listXaPhuong = [
    "Quang Minh",
    "Quang Bình",
    "Quang Lịch",
    "Vũ Quý",
    "TP.Thái Bình",
    "Vũ Thư",
    "Kiến Xương",
    "Hưng Hà",
    "Đông Hưng",
    "Tiền Hải"
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 896;
    S key = S.of(context);

    void onChange(GenderRadio value) {
      setState(() {
        _genderRadio = value;
      });
    }

    void onSelectedCountry(String value) {
      setState(() {
        valueCountry = value;
      });
    }

    void onSelectedLocal(String value) {
      setState(() {
        valueLocal = value;
      });
    }

    void onSelectedXaPhuong(String value) {
      setState(() {
        valueXaPhuong = value;
      });
    }

    void onSelectedTinhThanh(String value) {
      setState(() {
        valueTinhThanh = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(S.of(context).infomation, style: styleTextBlue()),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            top: 10 * height, left: 10 * width, right: 10 * width),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              customTextField(context, key.fullname, key.input_name,
                  TextInputType.text, true, controllerName),
              customTextField(context, key.birthday, key.input_birthday,
                  TextInputType.datetime, true, controllerBirtday),
              customGender(context, key.gender, _genderRadio, onChange, true),
              Divider(height: 2),
              customTextField(context, key.cmt, key.input_cmt,
                  TextInputType.number, true, controllerCMT),
              customSpinner(context, key.select_country, valueCountry, true,
                  onSelectedCountry, listCountry),
              customSpinner(context, key.address, valueTinhThanh, true,
                  onSelectedTinhThanh, listTinhThanh),
              Container(
                  child: customSpinner(context, "", valueLocal, true,
                      onSelectedLocal, listLocal),
                  margin: EdgeInsets.only(left: 15, right: 15)),
              Container(
                  child: customSpinner(context, "", valueXaPhuong, true,
                      onSelectedXaPhuong, listXaPhuong),
                  margin: EdgeInsets.only(left: 15, right: 15)),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextField(
          BuildContext context,
          String title,
          String hintTitle,
          TextInputType inputType,
          bool required,
          TextEditingController controller) =>
      Container(
          child: ListTile(
              title: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: title,
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                required
                    ? TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontSize: 17))
                    : TextSpan()
              ])),
              subtitle: TextField(
                  controller: controller,
                  keyboardType: inputType,
                  maxLength: inputType == TextInputType.datetime ? 8 : 50,
                  decoration: InputDecoration(hintText: hintTitle))),
          margin: EdgeInsets.only(top: 10));

  Widget customGender(BuildContext context, String title,
          GenderRadio genderRadio, Function onChange, bool required) =>
      Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: title,
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                required
                    ? TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontSize: 17))
                    : TextSpan()
              ])),
              StatefulBuilder(builder: (context, setState) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: RadioListTile<GenderRadio>(
                            title: Text(S.of(context).male),
                            value: GenderRadio.male,
                            groupValue: genderRadio,
                            onChanged: onChange)),
                    Expanded(
                        child: RadioListTile<GenderRadio>(
                            title: Text(S.of(context).female),
                            value: GenderRadio.female,
                            groupValue: genderRadio,
                            onChanged: onChange)),
                  ],
                );
              })
            ],
          ),
          margin: EdgeInsets.only(top: 10, left: 20));

  Widget customSpinner(BuildContext context, String title, String value,
          bool required, Function onSelected, List<String> list) =>
      Container(
          child: title != ""
              ? ListTile(
                  title: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: title,
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                    required
                        ? TextSpan(
                            text: " *",
                            style: TextStyle(color: Colors.red, fontSize: 17))
                        : TextSpan()
                  ])),
                  subtitle: StatefulBuilder(builder: (context, setState) {
                    return DropdownButton<String>(
                      items: list.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      isExpanded: true,
                      onChanged: onSelected,
                      hint: Text(
                        value,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    );
                  }))
              : DropdownButton<String>(
                  items: list.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  isExpanded: true,
                  onChanged: onSelected,
                  hint: Text(
                    value,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
          margin: EdgeInsets.only(top: 10));
}
