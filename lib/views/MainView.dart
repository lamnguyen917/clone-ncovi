import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/generated/i18n.dart';
import 'package:flutter_app_ncovi/views/profile/ProfileScreen.dart';
import 'package:flutter_app_ncovi/views/singin/AuthenticationScreen.dart';
import 'package:flutter_app_ncovi/views/singin/LoginScreen.dart';
import 'package:flutter_app_ncovi/views/splat/SplatScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'HomeView.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "NCovi",
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplatScreen(),
        routes: {
          SplatScreen.routeName: (_) => SplatScreen(),
          LoginScreen.routeName: (_) => LoginScreen(),
          AuthenticationScreen.routeName: (_) => AuthenticationScreen(),
          ProfileScreen.routeName: (_) => ProfileScreen()
        }
    );
  }
}
