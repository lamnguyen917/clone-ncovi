import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/generated/i18n.dart';
import 'package:flutter_app_ncovi/views/feedback/FeedBackScreen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class AuthenticationScreen extends StatelessWidget {
  // This widget is the root of your application.
  static const routeName = '/authen';

  @override
  Widget build(BuildContext context) {
    return PinCodeVerificationScreen();
  }
}

class PinCodeVerificationScreen extends StatefulWidget {
  String phoneNumber;

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.clear();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width / 414;
    final height = MediaQuery
        .of(context)
        .size
        .height / 896;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.indigo),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        backgroundColor: Colors.white,
        key: scaffoldKey,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              height: 896 * height,
              width: 414 * width,
              child: Center(child: SingleChildScrollView(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 5 * height),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5 * height),
                    child: Text(
                      S
                          .of(context)
                          .authen,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22 * width),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 5 * height),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5 * height),
                    child: Text(
                      S
                          .of(context)
                          .title_authen,
                      style: TextStyle(fontSize: 22 * width),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text("096xxxx162", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18 * width)),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(
                        horizontal: 30.0 * height, vertical: 8 * width),
                    child: Text(S
                        .of(context)
                        .input_otp, textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18 * width),),
                  ),
                  Padding(
                      padding:
                      EdgeInsets.symmetric(
                          vertical: 8.0 * width, horizontal: 30 * height),
                      child: PinCodeTextField(
                        length: 6,
                        obsecureText: false,
                        animationType: AnimationType.fade,
                        shape: PinCodeFieldShape.box,
                        animationDuration: Duration(milliseconds: 300),
                        fieldHeight: 80 * height,
                        fieldWidth: 50 * width,
                        selectedFillColor: Colors.white,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        enableActiveFill: true,
                        textInputType: TextInputType.number,
//                    controller: textEditingController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                      )),
                  SizedBox(height: 10 * height),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: S
                            .of(context)
                            .not_get_code,
                        style: TextStyle(
                            color: Colors.black, fontSize: 18 * width),
                        children: [
                          TextSpan(
                              text: ' ${S
                                  .of(context)
                                  .send_again}',
                              recognizer: onTapRecognizer,
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 18 * width)),
                          TextSpan(
                              text: ' (02:59)',
                              recognizer: onTapRecognizer,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 18 * width))
                        ]),
                  ),
                  SizedBox(
                    height: 20 * height,
                  ),
                  Container(
                    width: 414 * width,
                    height: 80 * height,
                    margin:
                    EdgeInsets.symmetric(
                        vertical: 16.0 * width, horizontal: 30 * height),
                    child: ButtonTheme(
                      height: 50,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              FeedBackScreen.routeName, (
                              Route<dynamic> route) => false);
                        },
                        child: Text(
                          S
                              .of(context)
                              .confirm
                              .toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(10 * width)),
                  ),
                ],
              ),),),
            )));
  }
}