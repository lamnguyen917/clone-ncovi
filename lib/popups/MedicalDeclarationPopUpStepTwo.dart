import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/widgets/MainAppBar.dart';

class MedicalDeclarationPopUpStepTwo extends StatelessWidget {
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
        body: TabBarView(
          children: <Widget>[
            _DeclarationPopUpContent(),
            _DeclarationPopUpContent(),
          ],
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
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      margin: const EdgeInsets.only(
        top: 5,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      color: Colors.white,
      child: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Step 2'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
