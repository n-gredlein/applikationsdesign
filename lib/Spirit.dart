import 'index.dart';
import 'dart:async' as async;

class Spirit extends Player {
  Spirit(MuseumGame game)
      : super(game,
      mapPos: Vect2<int>(1, 0),
      animationLeft: AssetLoader.spiritAnimationLeft,
      animationRight: AssetLoader.spiritAnimationRight,
      animationUp: AssetLoader.spiritAnimationUp,
      animationDown: AssetLoader.spiritAnimationDown,
      animationIdle: AssetLoader.spiritAnimationIdle) {
    lives = 3;
    canKill = 0;
  }

  async.Timer? timer;
  late int lives;
  late int canKill;

  void beamToPos(int x, int y) {
    mapPos = Vect2<int>(x, y);
    int px = (game.map.screenTileDimensions.x / 2).floor();
    int py = (game.map.screenTileDimensions.y / 2).floor();
    screenPos = Vect2<int>(px, py);
    targetPos = Vect2<double>(raster * px, raster * py);
    pos = Vect2<double>(targetPos.x, targetPos.y);
    game.direction = Direction.none;
    game.map.bgrTilePos = Vect2<int>(-x + px, -y + py);
    game.map.bgrPos = Vector2(raster * game.map.bgrTilePos.x, raster * game.map.bgrTilePos.y);
    game.map.bgrTargetPos = Vector2(game.map.bgrPos.x, game.map.bgrPos.y);
  }

  @override
  void update([Direction direction = Direction.none]) {
    if (direction == Direction.right) {
      currentAnimation = animationRight;
      if (pos.x < targetPos.x) pos.x += spiritSpeed;
      if (game.map.bgrPos.x > game.map.bgrTargetPos.x) {
        game.map.bgrPos.x -= spiritSpeed;
      }
      if (pos.x >= targetPos.x &&
          game.map.bgrPos.x <= game.map.bgrTargetPos.x) {
        game.direction = Direction.none;
        idle();
        game.map.checkGrain(mapPos.x, mapPos.y);
      }
    } else if (direction == Direction.left) {
      currentAnimation = animationLeft;
      if (pos.x > targetPos.x) pos.x -= spiritSpeed;
      if (game.map.bgrPos.x < game.map.bgrTargetPos.x) {
        game.map.bgrPos.x += spiritSpeed;
      }
      if (pos.x <= targetPos.x &&
          game.map.bgrPos.x >= game.map.bgrTargetPos.x) {
        game.direction = Direction.none;
        idle();
        game.map.checkGrain(mapPos.x, mapPos.y);
      }
    } else if (direction == Direction.down) {
      currentAnimation = animationDown;
      if (pos.y < targetPos.y) pos.y += spiritSpeed;
      if (game.map.bgrPos.y > game.map.bgrTargetPos.y) {
        game.map.bgrPos.y -= spiritSpeed;
      }
      if (pos.y >= targetPos.y &&
          game.map.bgrPos.y <= game.map.bgrTargetPos.y) {
        game.direction = Direction.none;
        idle();
        game.map.checkGrain(mapPos.x, mapPos.y);
      }
    } else if (direction == Direction.up) {
      currentAnimation = animationUp;
      if (pos.y > targetPos.y) pos.y -= spiritSpeed;
      if (game.map.bgrPos.y < game.map.bgrTargetPos.y) {
        game.map.bgrPos.y += spiritSpeed;
      }
      if (pos.y <= targetPos.y &&
          game.map.bgrPos.y >= game.map.bgrTargetPos.y) {
        game.direction = Direction.none;
        idle();
        game.map.checkGrain(mapPos.x, mapPos.y);
      }
    }
  }

  void idle() {
    timer?.cancel();
    timer = (async.Timer(Duration(seconds: 2),  () {
      if (game.direction == Direction.none) {
        currentAnimation = animationIdle;
        currentAnimation.update(1);
      }}));
  }

  // @override
  // void sound() {
  //   AssetLoader.cluck();
  // }
}