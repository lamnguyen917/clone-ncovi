import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/widgets/Timeline.dart';

class TestTimeLineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F4),
      appBar: AppBar(
        title: Text('TimeLine'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text('A'),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: TimeLine(
                              itemGap: 5,
                              mainIndicatorColor: Theme.of(context).accentColor,
                              children: <Widget>[
                                Container(height: 100, color: Colors.red),
                                Container(height: 50, color: Colors.green),
                                Container(height: 200, color: Colors.blue),
                                Container(height: 100, color: Colors.yellow),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
