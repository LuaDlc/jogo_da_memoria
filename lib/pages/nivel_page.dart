import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/card_nivel.dart';

class NivelPage extends StatelessWidget {
  final Modo modo;

  const NivelPage({Key? key, required this.modo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nivel do jogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            CardNivel(modo: modo, nivel: 6),
            CardNivel(modo: modo, nivel: 8),
            CardNivel(modo: modo, nivel: 10),
            CardNivel(modo: modo, nivel: 12),
            CardNivel(modo: modo, nivel: 16),
            CardNivel(modo: modo, nivel: 18),
            CardNivel(modo: modo, nivel: 20),
            CardNivel(modo: modo, nivel: 24),
            CardNivel(modo: modo, nivel: 28),
          ],
        ),
      ),
    );
  }
}
