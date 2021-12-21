import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_kagan_gredlein/StartPage.dart';
import 'package:flutter_application_kagan_gredlein/InfoPage.dart';
import 'package:flutter_application_kagan_gredlein/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: getInitialRoute(),
        onGenerateRoute: (route) => getRoute(route),
      );

  String getInitialRoute() => AppRoutes.start;

  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.start:
        return buildRoute(StartPage(), settings: settings);
      case AppRoutes.info:
        return buildRoute(InfoPage(), settings: settings);
      default:
        return null;
    }
  }

  MaterialPageRoute buildRoute(Widget child,
          {required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => child,
      );
}
