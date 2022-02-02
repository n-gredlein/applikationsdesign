import 'package:flutter/material.dart';
import 'MuseumGame.dart';

import 'index.dart';

class GamePage extends StatelessWidget {
  static late Size dimensions;
  final MuseumGame museumGame;

  const GamePage(this.museumGame, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dimensions = MediaQuery.of(context).size;
    museumGame.initialize(dimensions, context);
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              GameWidget(game: museumGame),
              Positioned.fill(
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.pause),
                    child: SizedBox(
                      height: 50,
                      width: 79,
                      child: Row(
                        children: const [
                          Icon(Icons.pause),
                          Text(
                            "Pause",
                          ),
                        ],
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber)),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
