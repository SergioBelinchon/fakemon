import 'package:fakemon/fakemon.dart';
import 'package:flame/components.dart';



class Hud extends PositionComponent with HasGameReference<Fakemon> {
  Hud({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority = 5,
  });


}