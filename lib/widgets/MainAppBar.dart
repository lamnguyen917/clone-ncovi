import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String titleText;
  final List<String> tabTitles;
  final TabController tabController;
  final Widget headerRight;
  final double topHeight;

  const MainAppBar({
    Key key,
    @required this.context,
    this.titleText = 'Title',
    this.tabTitles = const [],
    this.tabController,
    this.headerRight,
    this.topHeight = kToolbarHeight,
  })  : assert(tabTitles != null),
        assert(topHeight != null),
        super(key: key);

  PreferredSizeWidget get tabBar {
    if (tabTitles.isEmpty || tabTitles == null) return null;

    return TabBar(
      controller: tabController,
      labelColor: Theme.of(context).accentColor,
      unselectedLabelColor: Colors.grey,
      tabs: tabTitles
          .map(
            (text) => Tab(
              text: text,
            ),
          )
          .toList(),
    );
  }

  double get tabBarHeight {
    if (tabBar == null) return 0;
    return tabBar.preferredSize.height;
  }

  double get statusBarHeight => 0;

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      color: Colors.black,
    );

    final iconTheme = Theme.of(context).iconTheme.copyWith(
          color: Colors.black,
        );

    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      iconTheme: iconTheme,
      title: Text(
        titleText,
        maxLines: 2,
        style: titleStyle,
      ),
      centerTitle: false,
      bottom: tabBar,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(topHeight - statusBarHeight + tabBarHeight);
}
