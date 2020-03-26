import 'package:flutter_app_ncovi/generated/i18n.dart';
import 'package:flutter_app_ncovi/views/MainView.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'views/home/home_view.dart';
import 'views/MainView.dart';

void main() async {
  // await LocatorInjector.setupLocator();
  runApp(MainView());
}
