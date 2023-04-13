import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jogo_da_memoria/game_settings.dart';
import 'package:jogo_da_memoria/widgets/card_game.dart';
import 'package:jogo_da_memoria/widgets/game_score.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/game_controller.dart';
import '../models/game_opcao.dart';
import '../models/game_play.dart';
import '../widgets/feedback_game.dart';

class GamePage extends StatelessWidget {
  final GamePlay gamePlay;

  const GamePage({Key? key, required this.gamePlay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Scaffold(
        appBar: AppBar(
            //centraliza o titulo
            automaticallyImplyLeading: false,

            //row para o title
            title: GameScore(modo: gamePlay.modo!)),
        //body: const FeedbackGame(resultado: Resultado.eliminado)

        //matrix
        body: Observer(builder: (_) {
          if (controller.venceu) {
            return const FeedbackGame(resultado: Resultado.aprovado);
          } else if (controller.perdeu) {
            return const FeedbackGame(resultado: Resultado.eliminado);
          } else {
            return Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount:
                    GameSettings.gameBoardAxisCount(gamePlay.nivel!), //dinamico
                mainAxisSpacing: 15, //espacamento entre os niveis
                crossAxisSpacing: 15,
                padding: const EdgeInsets.all(24), //espacamento lateral
                children: controller.gameCards
                    .map((GameOpcao go) =>
                        CardGame(modo: gamePlay.modo!, gameOpcao: go))
                    .toList(),
              ),
            );
          }
        }));
  }
}
