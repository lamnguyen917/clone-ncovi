import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/views/home/HomeScreen.dart';

class HomeView extends StatelessWidget {
  textStyle() {
    return new TextStyle(color: Colors.white, fontSize: 30.0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // appBar: AppBar(),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            new Container(
              color: Colors.blueGrey,
              child: new Center(
                child: new Text(
                  "Health monitoring page",
                  style: textStyle(),
                ),
              ),
            ),
            new Container(
              color: Colors.teal,
              child: new Center(
                child: new Text(
                  "Reflect information page",
                  style: textStyle(),
                ),
              ),
            ),
            new Container(
              color: Colors.blue,
              child: new Center(
                child: new Text(
                  "Category page",
                  style: textStyle(),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.equalizer),
              ),
              Tab(
                icon: Icon(Icons.feedback),
              ),
              Tab(
                icon: Icon(Icons.menu),
              ),
            ],
            labelColor: Colors.accents[0],
          ),
        ),
      ),
    );
  }
}
