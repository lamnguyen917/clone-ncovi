import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/model/ChoiceLanguage.dart';
import 'package:flutter_app_ncovi/views/custom/CustomBoxDecoration.dart';

class CustomChoiceLanguage extends StatefulWidget {
  @override
  _CustomChoiceLanguageState createState() => _CustomChoiceLanguageState();
}

class _CustomChoiceLanguageState extends State<CustomChoiceLanguage> {
  final List<ChoiceLanguage> listLanguage = [
    ChoiceLanguage(id: 0, title: "VI", iconData: Icons.add_to_queue),
    ChoiceLanguage(id: 1, title: "EN", iconData: Icons.mail_outline)
  ];
  bool isSelected;
  Function setSelected;
  String selectedChoice = "";

  _buildChoiceList(double width, double height) {
    List<Widget> choices = List();
    listLanguage.forEach((item) {
      choices.add(Container(
        decoration: decorationBackgroundNone(),
        width: 80 * width,
        height: 40 * height,
        margin: EdgeInsets.only(right: 10 * width),
        child: ChoiceChip(
          selectedShadowColor: Colors.white,
          backgroundColor: Colors.white,
          selectedColor: Colors.white,
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(item.iconData),
              SizedBox(width: 10),
              Text(
                item.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15 * width),
              )
            ],
          ),
          selected: selectedChoice == item.title,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item.title;
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 896;

    return Wrap(
      children: _buildChoiceList(width, height),
    );
  }
}
