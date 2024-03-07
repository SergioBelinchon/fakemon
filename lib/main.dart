import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'componentes/pantallaInicio.dart';
import 'fakemon.dart';


void main() {
  runApp(FakemonApp());
}

class FakemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantallaInicio(),
    );
  }

}
/*
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  Fakemon game = Fakemon();
  runApp(GameWidget(game: kDebugMode? Fakemon() : game),
  );


}

 */