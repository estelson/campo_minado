import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/models/campo/campo.dart';
import 'package:campo_minado/models/tabuleiro/tabuleiro.dart';
import 'package:flutter/material.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  const TabuleiroWidget({Key? key, required this.tabuleiro, required this.onAbrir, required this.onAlternarMarcacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((campo) {
          return CampoWidget(
            campo: campo,
            onAbrir: onAbrir,
            onAlternarMarcacao: onAlternarMarcacao,
          );
        }).toList(),
      ),
    );
  }
}
