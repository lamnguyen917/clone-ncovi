import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/popups/MedicalDeclarationPopUpStepOne.dart';

class HomeScreenDeclarationPopUp extends StatelessWidget {
  void showMedicalDeclarationPopUp(BuildContext context) {
    showDialog(
        context: context, builder: (_) => MedicalDeclarationPopUpStepOne());
  }

  Widget buildPopupButton({
    @required BuildContext context,
    @required Function onPressed,
    @required String title,
  }) {
    final accentColor = Theme.of(context).accentColor;
    final textStyle = TextStyle(
      color: Colors.white,
    );

    return Container(
      height: double.infinity,
      child: RaisedButton(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        color: accentColor,
        child: Text(
          title.toUpperCase(),
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                height: 200,
                color: Colors.grey,
                child: Center(
                  child: Text('Top info content coming soon ...'),
                ),
              ),
              Container(
                child: Text('A'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 20,
                  right: 20,
                  bottom: 15,
                ),
                child: Container(
                  child: IntrinsicHeight(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: buildPopupButton(
                            context: context,
                            title: 'Khai bao y te tu nguyen',
                            onPressed: () {
                              showMedicalDeclarationPopUp(context);
                            },
                          ),
                        ),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                          child: buildPopupButton(
                            context: context,
                            title: 'Huong dan phong chong dich',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 5,
                color: Color(0xFFF1F5F4),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text('A'),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: Container(
                          height: 400,
                          color: Colors.lime,
                          child: Center(
                            child: Text('MapBox coming soon ...'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
