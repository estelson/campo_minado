import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo/campo.dart';
import 'package:campo_minado/models/exceptions/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({Key? key}) : super(key: key);

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool? _venceu;
  final Tabuleiro _tabuleiro = Tabuleiro(
    linhas: 12,
    colunas: 12,
    qtdeBombas: 3,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: _venceu,
          onReiniciar: _reiniciar,
        ),
        body: TabuleiroWidget(
          tabuleiro: _tabuleiro,
          onAbrir: _abrir,
          onAlternarMarcacao: _alternarMarcacao,
        ),
      ),
    );
  }

  _abrir(Campo campo) {
    // Finaliza a partida, não permitindo mais que o jogador clique nos campos
    if(_venceu != null) {
      return;
    }

    setState(() {
      try {
        campo.abrir();

        if(_tabuleiro.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro.revelarBombas();
      }
    });
  }

  _alternarMarcacao(Campo campo) {
    // Finaliza a partida, não permitindo mais que o jogador clique nos campos
    if(_venceu != null) {
      return;
    }

    setState(() {
      campo.alternarMarcacao();

      if(_tabuleiro.resolvido) {
        _venceu = true;
      }
    });
  }

  _reiniciar() {
    setState(() {
      _venceu = null;

      _tabuleiro.reiniciar();
    });
  }
}
