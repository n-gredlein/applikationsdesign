import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_kagan_gredlein/StartPage.dart';
import 'package:flutter_application_kagan_gredlein/InfoPage.dart';
import 'package:flutter_application_kagan_gredlein/PausePage.dart';
import 'package:flutter_application_kagan_gredlein/GamePage.dart';
import 'package:flutter_application_kagan_gredlein/FinishPage.dart';
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
      theme: ThemeData(
          fontFamily: 'Pixellari',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 50.0, color: Colors.white),
            headline2: TextStyle(fontSize: 20.0, color: Colors.white),
            subtitle1:
                TextStyle(fontSize: 16.0, fontFamily: 'OpenSans-Regular'),
            bodyText2:
                TextStyle(fontSize: 16.0, fontFamily: 'OpenSans-Regular'),
            button: TextStyle(fontSize: 20.0),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.transparent, elevation: 0.0),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ))));

  String getInitialRoute() => AppRoutes.start;

  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.start:
        return buildRoute(StartPage(), settings: settings);
      case AppRoutes.info:
        return buildRoute(InfoPage(), settings: settings);
      case AppRoutes.pause:
        return buildRoute(PausePage(), settings: settings);
      case AppRoutes.game:
        return buildRoute(GamePage(), settings: settings);
      case AppRoutes.finish:
        return buildRoute(FinishPage(), settings: settings);
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
