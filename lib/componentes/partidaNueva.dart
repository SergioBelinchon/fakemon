import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PartidaNueva extends StatefulWidget {
  @override
  _PartidaNuevaState createState() => _PartidaNuevaState();
}

class _PartidaNuevaState extends State<PartidaNueva> {
  bool _mostrarBotonGenero = false; // Controla la visibilidad de los botones de género
  bool _generoSeleccionado = false; // Controla si se ha seleccionado el género

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PARTIDA NUEVA',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Texto de bienvenida animado
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    '¡Bienvenido a tu nueva partida! En esta aventura recorrerás las profundidades de Kinun acompañado de maravillosas criaturas llamadas Fakemon!',
                    textStyle: const TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
                totalRepeatCount: 1, // Repetir solo una vez
                onFinished: () {
                  setState(() {
                    _mostrarBotonGenero = true; // Mostrar los botones de género
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            // Texto de la pregunta de género animado
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Antes de comenzar, ¿Eres chico o chica?',
                  textStyle: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ],
              totalRepeatCount: 1, // Repetir solo una vez
              onFinished: () {
                // Una vez que se ha mostrado la pregunta, no es necesario hacer nada
              },
            ),
            const SizedBox(height: 20),
            // Botones de género
            Visibility(
              visible: _mostrarBotonGenero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _seleccionarGenero('Chico');
                    },
                    child: const Text('Chico'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _seleccionarGenero('Chica');
                    },
                    child: const Text('Chica'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Botón para comenzar el juego
            Visibility(
              visible: _generoSeleccionado,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para comenzar el juego
                },
                child: const Text('Comenzar juego'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para seleccionar el género
  void _seleccionarGenero(String genero) {
    setState(() {
      _generoSeleccionado = true; // El género ha sido seleccionado
    });
  }
}
