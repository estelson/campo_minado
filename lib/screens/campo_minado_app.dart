import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/models/campo/campo.dart';
import 'package:campo_minado/models/exceptions/explosao_exception.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Campo vizinho1 = Campo(linha: 1, coluna: 0);
    vizinho1.minar();

    Campo vizinho2 = Campo(linha: 1, coluna: 1);
    vizinho2.minar();

    Campo campo = Campo(linha: 0, coluna: 0);
    campo.adicionarVizinho(vizinho1);
    campo.adicionarVizinho(vizinho2);

    try {
      // campo.minar();
      // campo.abrir();
      campo.alternarMarcacao();
    } on ExplosaoException {}

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          onReiniciar: _reiniciar,
        ),
        body: CampoWidget(campo: campo, onAbrir: _abrir, onAlternarMarcacao: _alternarMarcacao),
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
