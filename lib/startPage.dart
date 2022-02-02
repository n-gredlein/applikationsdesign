import 'package:flutter/material.dart';
import 'package:museum_tiles/index.dart';
import 'package:flutter/src/widgets/image.dart' as im;

import 'MuseumGame.dart';

class StartPage extends StatelessWidget {
  final MuseumGame game;

  const StartPage(this.game);

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('DAS KLEINE GESPENST',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
                Text('IM MUSEUM', style: Theme.of(context).textTheme.headline2),
                im.Image.asset(
                  'assets/images/ghost_right.png',
                  height: size.height * .2,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                    width: 121,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.game);
                        //Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow),
                          Text(
                            "Starten",
                          )
                        ],
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.lime)),
                    )),
                FloatingActionButton(
                  child: Icon(
                    Icons.info,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.info);
                  },
                ),
              ],
            ))));
  }
}
