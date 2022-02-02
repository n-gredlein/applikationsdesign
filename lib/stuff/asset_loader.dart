import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';

import '../index.dart';

class AssetLoader {
  static const spiritPath = "ghost.png";

  static var spiritImage;
  static var logoImage;
  static const music = "backgroundaudio.ogg";
  static var player;
  static var musicPlayer;
  static SharedPreferences? prefs;
  static bool? isPlayingEffects;

  static init(SharedPreferences p) {
    prefs = p;
    isPlayingEffects ??= false;
    player ??= FlameAudio.audioCache;
  }

  static Future loadAll() async {
    spiritImage = await Flame.images.load(spiritPath);
  }

  static void loadAudio() {
    assert(player != null);
    player?.clearCache();
    player?.loadAll(music);
    player?.disableLog();
  }

  static SpriteAnimation get spiritAnimationRight {
    return SpriteAnimation.fromFrameData(
        spiritImage,
        SpriteAnimationData.sequenced(
          amount: 1,
          texturePosition: Vector2(0, 0),
          textureSize: Vector2(raster, raster),
          stepTime: 1.0,
          loop: true,
        ));
  }

  static SpriteAnimation get spiritAnimationLeft {
    return SpriteAnimation.fromFrameData(
        spiritImage,
        SpriteAnimationData.sequenced(
          amount: 1,
          texturePosition: Vector2(raster, 0),
          textureSize: Vector2(raster, raster),
          stepTime: 1.0,
          loop: true,
        ));
  }

  static SpriteAnimation get spiritAnimationDown {
    return SpriteAnimation.fromFrameData(
        spiritImage,
        SpriteAnimationData.sequenced(
          amount: 1,
          texturePosition: Vector2(raster * 2, 0),
          textureSize: Vector2(raster, raster),
          stepTime: 1.0,
          loop: true,
        ));
  }

  static SpriteAnimation get spiritAnimationUp {
    return SpriteAnimation.fromFrameData(
        spiritImage,
        SpriteAnimationData.sequenced(
          amount: 1,
          texturePosition: Vector2(raster * 2, 0),
          textureSize: Vector2(raster, raster),
          stepTime: 1.0,
          loop: true,
        ));
  }

  static SpriteAnimation get spiritAnimationIdle {
    return SpriteAnimation.fromFrameData(
        spiritImage,
        SpriteAnimationData.variable(
          amount: 1,
          texturePosition: Vector2(raster * 3, 0),
          textureSize: Vector2(raster, raster),
          stepTimes: [20, 0.5, 1, 5],
          loop: true,
        ));
  }

  static void initMusic() {
    player
        .loop(
      music,
      volume: 0.5,
    )
        .then((p) {
      musicPlayer ??= p;
    });
  }

  static void stopMusic() {
    if (musicPlayer != null) {
      musicPlayer!.pause();
    }
  }

  static void startMusic() {
    if (musicPlayer != null) {
      musicPlayer!.resume();
    }
  }
}
