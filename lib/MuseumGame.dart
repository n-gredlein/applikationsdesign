import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/image.dart' as im;
import './stuff/asset_loader.dart';

import 'helper.dart';
import 'index.dart';

class MuseumGame extends BaseGame with TapDetector {
  final Random rnd = Random();
  final String word = 'Echo';
  String guessLetters = '';
  final TextEditingController textEditingController = TextEditingController();

  late Size _dimensions;
  late Spirit spirit;
  late Map map;
  // late var pauseImage;
  late Timer _pauseTimer;
  late bool _timerPaused;
  bool _loaded;
  static const pauseMillis = 800;

  set paused(bool p) {
    if (p != _paused) {
      if (p) {
        AssetLoader.stopMusic();
      } else {
        AssetLoader.startMusic();
      }
    }
    _paused = p;
  }

  bool get paused {
    return _paused;
  }

  bool _paused = true;

  late Direction direction;
  late InputHandler inputHandler;
  // late List<Enemy> enemies;
  Vect2<int> screenTileDimensions = Vect2(0, 0);
  late int score;
  late Vect2<int> spawnPos;
  late int level;
  late BuildContext context;
  late SharedPreferences prefs;
  late double scaleFactor;

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    // paused = state.index != AppLifecycleState.resumed.index;
  }

  MuseumGame(this.prefs)
      : _loaded = false,
        _timerPaused = false {
    AssetLoader.initMusic();
    // this.paused = true;
    AssetLoader.loadAll().then((value) {
      print('loadAll');
      // pauseImage = AssetLoader.pauseImage;
      level = 1;
      score = 0;
      spirit = Spirit(this);
      _loaded = true;
    });
  }

  void initialize(Size dimensions, BuildContext context) {
    _dimensions = dimensions;
    this.context = context;
    scaleFactor = this._dimensions.width / 320.0 * 1.5;
    screenTileDimensions = Vect2<int>(
        (this._dimensions.width / (raster * scaleFactor)).floor(),
        (this._dimensions.height / (raster * scaleFactor)).floor());
    initLevel();
    direction = Direction.none;
  }

  void startGame() {
    direction = Direction.none;
    guessLetters = '';
  }

  void initLevel() {
    spawnPos = Vect2<int>(1, 0);
    spirit.initPos(spawnPos.x, spawnPos.y);
    map = Map(this, screenTileDimensions);
    inputHandler = InputHandler(this, map, spirit);
    guessLetters = '';
  }

  void restartLevel() {
    direction = Direction.none;
    _timerPaused = true;
    guessLetters = '';
    // _pauseTimer = Timer(Duration(milliseconds: pauseMillis), () {
    //   _timerPaused = false;
    // });
  }

  /// Game loop
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (!_loaded) return;
    canvas.scale(scaleFactor);
    // if (paused) {
    //   showPause(canvas);
    //   return;
    // }
    if (!map.initialized || _timerPaused) {
      return;
    }
    var col = Paint()..color = Color(0xff004800);
    canvas.drawPaint(col);
    canvas.translate(map.bgrPos.x, map.bgrPos.y);
    map.render(canvas);
    // for (var e in enemies) {
    //   if (!e.isKilled && e.mapPos == spirit.mapPos) {
    //     if (spirit.canKill > 0) {
    //       //Kill enemy!
    //       e.isKilled = true;
    //       spirit.canKill--;
    //       continue;
    //     }
    //     // Hit by enemy
    //     AssetLoader.cry();
    //     spirit.lives--;
    //     // More lives left?
    //     if (spirit.lives > 0) {
    //       //Reset chicken and enemies to pos
    //       spirit.beamToPos(spawnPos.x, spawnPos.y);
    //       enemies.forEach((e) => e.initPos(e.initialPos.x, e.initialPos.y));
    //       restartLevel();
    //     }
    //     break;
    //   }
    //   e.update();
    //   e.render(canvas);
    // }
    //Check if next level?
    if (map.tileDimensions.x - 2 == spirit.mapPos.x &&
        map.tileDimensions.y - 1 == spirit.mapPos.y) {
      level++;
      // If end then repeat
      // if (level > maxLevel) level = 1;
      initLevel();
      restartLevel();
    }
    canvas.restore();
    canvas.scale(scaleFactor);
    spirit.update(direction);
    spirit.render(canvas);

    //Render Text and Button
    TextPainter ltxt =
        gameTextConf(context, scaleFactor).toTextPainter("Level${this.level}");
    ltxt.paint(canvas,
        Offset((_dimensions.width / scaleFactor) / 2 - ltxt.width / 2, 10.0));

    String text = guessLetters;
    for (int i = guessLetters.length; i < word.length; i++) {
      text += '_';
    }
    TextPainter txt = gameTextConf(context, scaleFactor)
        .toTextPainter(text.split('').join(' '));
    txt.paint(
        canvas,
        Offset((_dimensions.width / scaleFactor) / 2 - txt.width / 2,
            10.0 + ltxt.height * 1.5));
  }

  @override
  void onTapDown(TapDownDetails evt) {
    if (!_loaded) return;
    var xp = evt.globalPosition.dx;
    var yp = evt.globalPosition.dy;
    if (!map.initialized) return;
    if (xp < raster * scaleFactor &&
        yp > _dimensions.height - raster * scaleFactor) {
      // Pause
      // this.paused = true;
      // Navigator.pushReplacementNamed(context, PausePage.route);
    } else {
      inputHandler.touched(xp, yp);
      print("Chicken: ${spirit.mapPos.x}, ${spirit.mapPos.y}");
    }
  }

  @override
  void update(double t) {
    super.update(t);
    if (!_loaded) return;
    if (spirit.lives <= 0) {
      // paused = true;
      this._timerPaused = true;
      // this._pauseTimer = Timer(Duration(milliseconds: pauseMillis), () {
      //   _timerPaused = false;
      //   Navigator.of(context).pushReplacementNamed(GameOverPage.route);
      // });
    }
  }

  void showRandomLetter() async {
    String letterLeft = word;
    for (int i = 0; i < word.length; i++) {
      for (int j = 0; j < guessLetters.length; j++) {
        if (word[i] == guessLetters[j]) {
          letterLeft = letterLeft.replaceFirst(guessLetters[j], '');
        }
      }
    }
    // print('letterLeft   $letterLeft');
    // print('guessLetters   $guessLetters');
    int index = rnd.nextInt(letterLeft.length);
    String randomLetter = letterLeft[index];
    guessLetters += randomLetter;
    // print('randomLetter   $randomLetter');
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      await showDialog(
          context: context,
          builder: (context) => _infoDialog(context, guessLetters.length),
          barrierDismissible: false);
      if (word.length == guessLetters.length) {
        await showDialog(
            context: context,
            builder: (context) => _solutionDialog(context),
            barrierDismissible: false);
      }
    });
  }

  Widget _startDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text("Du bist jetzt in der Fabrik..."),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          im.Image(
            height: 170,
            fit: BoxFit.cover,
            image: AssetImage('assets/images/ghost_right.png'),
          ),
          Text(
              "Suche hier nach Buchstaben, um den Schlüssel zum Schatz zu bekommen."),
        ],
      ),
      actions: <Widget>[
        SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.finish),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lime)),
              child: const Text('Weiter'),
            )),
      ],
    );
  }

  Widget _infoDialog(BuildContext context, int index) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text("Ausstellungsstück Name"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          im.Image(
            height: MediaQuery.of(context).size.height * .2,
            fit: BoxFit.cover,
            image: AssetImage('assets/images/level${level}_$index.jpeg'),
          ),
          const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        ],
      ),
      actions: <Widget>[
        SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lime)),
              child: const Text('Buchstabe einsammeln'),
            )),
      ],
    );
  }

  /*Widget _finishDialog(BuildContext context) {
    guessLetters = '';
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text("Sehr gut, du hast alle Buchstaben gefunden!"),
      content: const Text("Jetzt kannst du den Schatz."),
      actions: <Widget>[
        SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.finish);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lime)),
              child: const Text('Weiter'),
            )),
      ],
    );
  }*/

  Widget _solutionDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text("Du hast es fast geschafft"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              "Bringe noch die gesammelten Buchstaben in die richtige Reihenfolge, um den Schatz zu öffnen."),
          TextField(
            controller: textEditingController,
          ),
        ],
      ),
      actions: <Widget>[
        SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (textEditingController.text.toLowerCase() ==
                    word.toLowerCase()) {
                  textEditingController.clear();
                  Navigator.of(context).pushNamed(AppRoutes.finish);
                } else {
                  textEditingController.clear();
                }
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lime)),
              child: const Text('Schatz öffnen'),
            )),
      ],
    );
  }
}
