import 'dart:async';

import 'package:fakemon/personajes/player.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Ciudad extends World
{
  final String nombreMapa;
  Ciudad({required this.nombreMapa});
  late TiledComponent mapa;
  
  @override
  FutureOr<void> onLoad() async
  {
    mapa = await TiledComponent.load('$nombreMapa.tmx', Vector2.all(16));

    add(mapa);

    final capaZonaSpawn = mapa.tileMap.getLayer<ObjectGroup>('ZonaSpawn');

    for(final zonaSpawn in capaZonaSpawn!.objects)
      {
        switch(zonaSpawn.class_)
            {
          case 'Player':
            final player =
            Player(
                personaje: 'Pink Man',
                position: Vector2(zonaSpawn.x, zonaSpawn.y),
            );
            add(player);
            break;
          default:
        }
      }
    return super.onLoad();
  }
}