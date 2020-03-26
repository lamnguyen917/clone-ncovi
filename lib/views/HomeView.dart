import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/views/home/HomeScreen.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _TabTitle {
  String title;
  int id;
  Icon icon;
  Widget body;

  _TabTitle(this.id, this.title, this.icon, this.body);
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  textStyle() {
    return new TextStyle(color: Colors.white, fontSize: 30.0);
  }

  TabController _tabController;
  PageController _pageController = PageController(initialPage: 0);
  List<_TabTitle> tabList;

  var currentPage = 0;
  bool isPageCanChanged;

  @override
  void initState() {
    super.initState();
    tabList = [
      new _TabTitle(0, "a", Icon(Icons.home), HomeScreen()),
      new _TabTitle(1, "b", Icon(Icons.equalizer), Text("data")),
      new _TabTitle(2, "c", Icon(Icons.feedback), Text("data")),
      new _TabTitle(3, "d", Icon(Icons.menu), Text("data")),
    ];
    _tabController = TabController(
      length: tabList.length,
      vsync: this,
    );
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        print(_tabController.index);
        onPageChange(_tabController.index, p: _pageController);
      }
    });
  }

  onPageChange(int index, {PageController p, TabController t}) async {
    currentPage = index;
    if (p != null) {
      isPageCanChanged = false;
      await _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      isPageCanChanged = true;
    } else {
      _tabController.animateTo(index);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: HomeScreen(),
  //     bottomNavigationBar: BottomAppBar(
  //       child: Text("data"),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    print(_tabController);
    return Scaffold(
      // appBar: AppBar(),
      body: PageView.builder(
        itemCount: tabList.length,
        controller: _pageController,
        onPageChanged: (index) {
          if (isPageCanChanged) {
            onPageChange(index);
          }
        },
        itemBuilder: (context, index) {
          return Center(child: tabList[index].body);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.accents[0],
          unselectedLabelColor: Color(0xff666666),
          tabs: tabList.map((item) {
            return Tab(
              icon: item.icon,
            );
          }).toList(),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 4,
  //     child: Scaffold(
  //       // appBar: AppBar(),
  //       body: TabBarView(
  //         physics: NeverScrollableScrollPhysics(),
  //         children: [
  //           HomeScreen(),
  //           new Container(
  //             color: Colors.blueGrey,
  //             child: new Center(
  //               child: new Text(
  //                 "Health monitoring page",
  //                 style: textStyle(),
  //               ),
  //             ),
  //           ),
  //           new Container(
  //             color: Colors.teal,
  //             child: new Center(
  //               child: new Text(
  //                 "Reflect information page",
  //                 style: textStyle(),
  //               ),
  //             ),
  //           ),
  //           new Container(
  //             color: Colors.blue,
  //             child: new Center(
  //               child: new Text(
  //                 "Category page",
  //                 style: textStyle(),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       bottomNavigationBar: BottomAppBar(
  //         child: TabBar(
  //           tabs: [
  //             Tab(
  //               icon: Icon(Icons.home),
  //             ),
  //             Tab(
  //               icon: Icon(Icons.equalizer),
  //             ),
  //             Tab(
  //               icon: Icon(Icons.feedback),
  //             ),
  //             Tab(
  //               icon: Icon(Icons.menu),
  //             ),
  //           ],
  //           labelColor: Colors.accents[0],
  //         ),
  //       ),
  //     ),
  //   );
  // }

}
