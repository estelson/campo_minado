import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo/campo.dart';
import 'package:campo_minado/models/tabuleiro/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          onReiniciar: _reiniciar,
        ),
        body: TabuleiroWidget(
          tabuleiro: Tabuleiro(
            linhas: 15,
            colunas: 15,
            qtdeBombas: 10,
          ),
          onAbrir: _abrir,
          onAlternarMarcacao: _alternarMarcacao,
        ),
      ),
    );
  }

  _abrir(Campo campo) {
    debugPrint("abrir...");
  }

  _alternarMarcacao(Campo campo) {
    debugPrint("alternar marcacao...");
  }

  _reiniciar() {
    debugPrint("reiniciar...");
  }
}
