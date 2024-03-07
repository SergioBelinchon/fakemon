import 'package:fakemon/fakemon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'partidaNueva.dart';

class PantallaMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MENÚ',
          style: GoogleFonts.getFont(
            'Kdam Thmor Pro',
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/fondoMenu.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón "Partida Nueva"
              SizedBox(
                width: 200, // Ancho del botón
                child: ElevatedButton(
                  onPressed: () {
                    iniciarPartidaNueva(context);
                  },
                  child: Text(
                    'Partida Nueva',
                    style: GoogleFonts.getFont(
                      'Kdam Thmor Pro',
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espacio entre los botones
              // Botón "Opciones"
              SizedBox(
                width: 200, // Ancho del botón
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para ir a la pantalla de opciones
                  },
                  child: Text(
                    'Opciones',
                    style: GoogleFonts.getFont(
                      'Kdam Thmor Pro',
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void iniciarPartidaNueva(BuildContext context) {
    // Navega a la pantalla de juego usando Navigator.push
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PartidaNueva()),
    );
  }
}