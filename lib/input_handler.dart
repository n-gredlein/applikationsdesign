import 'Map.dart';

import 'index.dart';

class InputHandler {
  MuseumGame game;
  Map maze;
  Spirit spirit;

  InputHandler(this.game, this.maze, this.spirit);

  void _moveDir(Direction dir) {
    if (game.direction != Direction.none) return; // is already moving
    if (dir == Direction.up) {
      if (maze.isObstacle(spirit.mapPos.x, spirit.mapPos.y - 1)) {
        //Make a hole?
        Tile tile = maze.getTileFromLayer(0, spirit.mapPos.x, spirit.mapPos.y - 1);
        // if (spirit.canKill > 0 && tile.tileId == passageClosed[0]) {
        //   spirit.canKill--;
        //   tile.tileId = passageOpened[0];
        //   tile.gid = tile.tileId + 1;
        // }
        // spirit.sound();
        return;
      }
      spirit.currentAnimation.update(1);
      game.direction = Direction.up;
      // is chicken not at top edge?
      if (spirit.screenPos.y > 3) {
        spirit.move(Direction.up);
      } else if (maze.bgrTilePos.y < 3) {
        maze.moveTileMap(Direction.down);
      }
    }
    if (dir == Direction.down) {
      if (maze.isObstacle(spirit.mapPos.x, spirit.mapPos.y + 1)) {
        //Make a hole?
        Tile tile = maze.getTileFromLayer(0, spirit.mapPos.x, spirit.mapPos.y + 1);
        // if (spirit.canKill > 0 && tile.tileId == passageClosed[0]) {
        //   spirit.canKill--;
        //   tile.tileId = passageOpened[0];
        //   tile.gid = tile.tileId + 1; //id!= gid
        // }
        // spirit.sound();
        return;
      }
      spirit.currentAnimation.update(1);
      // is chicken not at bottom edge?
      game.direction = Direction.down;
      if (spirit.screenPos.y < maze.screenTileDimensions.y - 4) {
        spirit.move(Direction.down);
      } else if (maze.bgrTilePos.y > -maze.tileDimensions.y - 3 + maze.screenTileDimensions.y) {
        maze.moveTileMap(Direction.up);
      }
    }
    if (dir == Direction.left) {
      if (maze.isObstacle(spirit.mapPos.x - 1, spirit.mapPos.y)) {
        //Make a hole?
        Tile tile = maze.getTileFromLayer(0, spirit.mapPos.x - 1, spirit.mapPos.y);
        // if (spirit.canKill > 0 && tile.tileId == passageClosed[1]) {
        //   spirit.canKill--;
        //   tile.tileId = passageOpened[1];
        //   tile.gid = tile.tileId + 1;
        // }
        // spirit.sound();
        return;
      }
      spirit.currentAnimation.update(1);
      game.direction = Direction.left;
      // is chicken not at left edge?
      if (spirit.screenPos.x > 2) {
        spirit.move(Direction.left);
      } else if (maze.bgrTilePos.x < 2) {
        maze.moveTileMap(Direction.right);
      }
    }

    if (dir == Direction.right) {
      if (maze.isObstacle(spirit.mapPos.x + 1, spirit.mapPos.y)) {
        //Make a hole?
        Tile tile = maze.getTileFromLayer(0, spirit.mapPos.x + 1, spirit.mapPos.y);
        // if (spirit.canKill > 0 && tile.tileId == passageClosed[1]) {
        //   spirit.canKill--;
        //   tile.tileId = passageOpened[1];
        //   tile.gid = tile.tileId + 1;
        // }
        // spirit.sound();
        return;
      }
      spirit.currentAnimation.update(1);
      game.direction = Direction.right;
      // is chicken not at right edge?
      if (spirit.screenPos.x < maze.screenTileDimensions.x - 3) {
        spirit.move(Direction.right);
      } else if (maze.bgrTilePos.x > -maze.tileDimensions.x - 2 + maze.screenTileDimensions.x) {
        maze.moveTileMap(Direction.left);
      }
    }
  }

  void touched(double xp, double yp) {
    var centerX = spirit.screenPos.x * raster * game.scaleFactor + raster * game.scaleFactor / 2;
    var centerY = spirit.screenPos.y * raster * game.scaleFactor + raster * game.scaleFactor / 2;
    var dX = xp - centerX;
    var dY = yp - centerY;
    if (dX.abs() > dY.abs()) {
      //Horizontal
      if (dX > 0) {
        // R
        _moveDir(Direction.right);
      } else {
        // L
        _moveDir(Direction.left);
      }
    } else {
      // Vertical
      if (dY > 0) {
        // D
        _moveDir(Direction.down);
      } else {
        // U
        _moveDir(Direction.up);
      }
    }
    maze.tiles.generate(); // Update Map
  }
}