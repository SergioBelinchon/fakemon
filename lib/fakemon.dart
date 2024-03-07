import 'dart:async';
import 'dart:ui';

import 'package:fakemon/levels/ciudad.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';

class Fakemon extends FlameGame with HasKeyboardHandlerComponents
{

  @override
  Color backgroundColor() => const Color(0xFF3F3F3F);

  late final CameraComponent cam;

  final world = Ciudad(
    nombreMapa: 'Ciudad0'
  );

  @override
  FutureOr<void> onLoad() async
  {
    await images.loadAllImages();

    cam = CameraComponent.withFixedResolution(
        world: world,
        width: 480,
        height: 320);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);


    return super.onLoad();
  }
}