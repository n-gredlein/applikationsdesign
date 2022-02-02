import 'FinishPage.dart';
import 'InfoPage.dart';
import 'StartPage.dart';

import 'index.dart';
import 'package:flutter/material.dart';

late SharedPreferences prefs;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setOrientation(DeviceOrientation.portraitUp);
  Flame.device.fullScreen();

  SharedPreferences.getInstance().then((p) {
    prefs = p;

    AssetLoader.init(prefs);
    // AssetLoader.loadAudio();
    runApp(MyApp());
  });
}

final _spiritGame = MuseumGame(prefs);
final gamePage = GamePage(_spiritGame);
final startPage = StartPage(gamePage.museumGame);
final pausePage = PausePage();
final infoPage = InfoPage();
final finishPage = FinishPage();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // localizationsDelegates: [
        //   const LangDelegate(),
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        // supportedLocales: [
        //   const Locale('en'), // English
        //   const Locale('de'), // German
        //   const Locale('es'), // Spanish
        //   const Locale('fr'), // French
        // ],
        debugShowCheckedModeBanner: false,
        checkerboardOffscreenLayers: false,
        checkerboardRasterCacheImages: false,
        debugShowMaterialGrid: false,
        title: 'Museum Tiles',
        home: startPage,
        routes: <String, WidgetBuilder>{
          // SettingsPage.route: (context) => settingsPage,
          // AboutPage.route: (context) => aboutPage,
          AppRoutes.game: (context) => gamePage,
          AppRoutes.start: (context) => startPage,
          AppRoutes.info: (context) => infoPage,
          AppRoutes.pause: (context) => pausePage,
          AppRoutes.finish: (context) => finishPage,
          // LeaderBoardPage.route: (context) => leaderBoardPage,
          // GameOverPage.route: (context) => gameOverPage,
        },
        theme: ThemeData(
            fontFamily: 'Pixellari',
            textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 50.0, color: Colors.white),
              headline2: TextStyle(fontSize: 30.0, color: Colors.white),
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
  }
}
