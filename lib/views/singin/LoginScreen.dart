import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/generated/i18n.dart';
import 'package:flutter_app_ncovi/views/custom/CustomBoxDecoration.dart';
import 'package:flutter_app_ncovi/views/custom/CustomChoiceLanguage.dart';
import 'package:flutter_app_ncovi/views/custom/Style.dart';

class LoginScreen extends StatefulWidget {
  // Create routeName use navigation screen
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 896;
    final TextEditingController controller = TextEditingController();

    return Scaffold(
        body: Container(
      child: Stack(
        children: <Widget>[
          Image.asset("assets/images/bg_trongdong.png", fit: BoxFit.cover),
          Column(
            children: <Widget>[
              Container(
                  color: Colors.indigo.withOpacity(0.93),
                  height: 210 * height,
                  child: Center(child: customHeader(context, width, height))),
              Container(
                  color: Colors.white,
                  width: width * 414,
                  height: 686 * height,
                  child: customContent(context, width, height, controller)),
            ],
          )
        ],
      ),
    ));
  }

  Widget customHeader(BuildContext context, double width, double height) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(S.of(context).banchidao.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19 * width)),
          Text(S.of(context).phongchongdichbenh.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19 * width)),
          SizedBox(
            height: 20 * height,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo_boyte.png",
                  fit: BoxFit.cover,
                  width: 70 * width,
                  height: 70 * width,
                ),
                SizedBox(width: 20 * width),
                Image.asset(
                  "assets/images/logo_bothongtinvatruyenthong.png",
                  fit: BoxFit.cover,
                  width: 70 * width,
                  height: 70 * width,
                )
              ],
            ),
            margin: EdgeInsets.only(bottom: 20 * height),
          )
        ],
      );

  Widget customContent(BuildContext context, double width, double height,
          TextEditingController controller) =>
      Container(
        margin: EdgeInsets.all(15 * width),
        child: Column(
          children: <Widget>[
            CustomChoiceLanguage(),
            SizedBox(height: 50 * height),
            ListTile(
                title: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: S.of(context).phone,
                      style: TextStyle(color: Colors.black, fontSize: 17)),
                  TextSpan(
                      text: " *",
                      style: TextStyle(color: Colors.red, fontSize: 17))
                ])),
                subtitle: TextField(
                    controller: controller,
                    keyboardType: TextInputType.phone,
                    decoration:
                        InputDecoration(hintText: S.of(context).input_number))),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(15 * width),
                        margin: EdgeInsets.only(
                            left: 20 * width,
                            right: 10 * width,
                            top: 30 * height),
                        decoration: decorationBackgroundNone(),
                        child: GestureDetector(
                            onTap: null,
                            child: Text(
                              S.of(context).register.toUpperCase(),
                              style: styleTextBlue(),
                              textAlign: TextAlign.center,
                            )))),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(15 * width),
                        margin: EdgeInsets.only(
                            left: 10 * width,
                            top: 30 * height,
                            right: 20 * width),
                        decoration: decorationBackground(),
                        child: GestureDetector(
                            onTap: null,
                            child: Text(S.of(context).login.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: styleTextWhile())))),
              ],
            )
          ],
        ),
      );
}
