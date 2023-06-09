import 'package:flutter/material.dart';

import '../constants.dart';
import '../game_settings.dart';
import '../models/game_play.dart';
import '../widgets/card_nivel.dart';

class NivelPage extends StatelessWidget {
  final Modo modo;

  const NivelPage({Key? key, required this.modo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final niveis = GameSettings.niveis
        .map((n) => CardNivel(gamePlay: GamePlay(modo: modo, nivel: n)))
        .toList();
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
          children: niveis,
        ),
      ),
    );
  }
}
