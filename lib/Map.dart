import 'dart:ui';
import 'index.dart';

class Map {
  late Tiled tiles;
  late Vect2<int> screenTileDimensions;
  late Size mapDimensions;
  late Vect2<int> tileDimensions;
  late Vector2 bgrPos;
  late Vector2 bgrTargetPos;
  late Vect2<int> bgrTilePos;
  late MuseumGame game;
  late bool _initialized;
  bool get initialized => _initialized;

  Map(this.game, this.screenTileDimensions) {
    tiles = Tiled("schmiede2.tmx", Size(raster, raster));
    _initialized = false;
    tiles.future!.then((t) {
      _initialized = true;
      tileDimensions = Vect2<int>(tiles.map.layers[0].width, tiles.map.layers[0].height);
      print("Maze: ${tileDimensions.x}, ${tileDimensions.y}");
      mapDimensions = Size((tileDimensions.x) * raster, (tileDimensions.y) * raster);
      // tiles.map.layers[1].visible = false;
      tiles.generate();
    });
    bgrPos = Vector2(0, 0);
    bgrTargetPos = Vector2(0, 0);
    bgrTilePos = Vect2<int>(0, 0);
  }

  void moveTileMap(Direction dir) {
    int xp = 0;
    int yp = 0;
    switch (dir) {
      case Direction.left:
        xp = -1;
        break;
      case Direction.right:
        xp = 1;
        break;
      case Direction.up:
        yp = -1;
        break;
      case Direction.down:
        yp = 1;
        break;
      case Direction.none:
        xp = 0;
        yp = 0;
        break;
    }
    bgrTargetPos.x += xp * raster;
    bgrTargetPos.y += yp * raster;
    bgrTilePos.add(xp, yp);
    game.spirit.mapPos.add(-xp, -yp);
  }

  bool isObstacle(int x, int y) {
    // Edges
    if (x < 0 || x >= tileDimensions.x) return true;
    if (y < 0 || y >= tileDimensions.y) return true;
    // ID of Tile ... Collision
    int id = getTileFromLayer(0, x, y).tileId;
    // print('id    $id');
    // return id > 3 && !passageOpened.contains(id);
    // return id > 300;
    return false;
  }

  Tile getTileFromLayer(int num, int x, int y) {
    return tiles.map.layers[num].tiles[y < 0 ? 0 : y][x < 0 ? 0 : x];
  }

  bool obstacle(Vect2<int> o) {
    return isObstacle(o.x, o.y);
  }

  bool checkGrain(int x, int y) {
    bool found = false;
    if (x < 0 || x >= tileDimensions.x) return true;
    if (y < 0 || y >= tileDimensions.y) return true;
    // ID of Tile ... Collision
    var tl = getTileFromLayer(1, x, y);
    var id = tl.tileId;
    if (id == 5) {
      tl.gid = 0;
      tl.tileId = 0;
      found = true;
      game.showRandomLetter();
    }
    return found;
  }

  void render(Canvas canvas) {
    tiles.render(canvas);
  }
}