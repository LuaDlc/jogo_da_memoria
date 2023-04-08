import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/theme.dart';
import '../constants.dart';

class CardGame extends StatefulWidget {
  final Modo modo;
  final int opcao;

  const CardGame({
    Key? key,
    required this.modo,
    required this.opcao,
  }) : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this, //sincroniza a animacao co, o state da tela
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    // fecha o widget
    animation.dispose();
    super.dispose();
  }

  flipCard() {
    if (animation.isAnimating) {
      animation.forward();
      Timer(const Duration(seconds: 2), () => animation.reverse());
    }
  }

  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi) {
      return AssetImage('images/${widget.opcao.toString()}.png');
    } else {
      return widget.modo == Modo.normal
          ? const AssetImage('images/card_normal.png')
          : const AssetImage('images/card_round.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (buildContext, context) {
          final angulo = animation.value *
              pi; //var para ajudar a calcular o angulo q o card vai virar
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(
                angulo); //matirx 4x4 q especifica as regras p/ fazer a transofrmacao

          return GestureDetector(
            onTap: () => flipCard(),
            child: Transform(
              transform: transform,
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.modo == Modo.normal
                            ? Colors.white
                            : Round6Theme.color,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: getImage(angulo),
                      ))),
            ),
          );
        });
  }
}
