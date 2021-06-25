import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bgm.dart';
import 'gameEngine.dart';

enum View {
  home,
  playing,
  lost,
  help,
  credits
} 

void main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  SharedPreferences storage = await SharedPreferences.getInstance();
  await Flame.images.loadAll(<String>[]);
  await Flame.audio.loadAll(<String>[]);

  Flame.audio.disableLog();
  await BGM.preload();  
  GameEngine game = GameEngine();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
  WidgetsBinding.instance.addObserver(BGMHandler());
  
}