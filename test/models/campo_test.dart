import 'package:campo_minado/models/campo/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("Campo", () {
    test("Abrir campo COM explosão", () {
      Campo c = Campo(linha: 0, coluna: 0);

      c.minar();

      expect(c.abrir, throwsException);
    });

    test("Abrir campo SEM explosão", () {
      Campo c = Campo(linha: 0, coluna: 0);

      c.abrir();

      expect(c.aberto, isTrue);
    });

    test("Adicionar vizinho", () {
      Campo c1 = Campo(coluna: 3, linha: 3);
      Campo c2 = Campo(coluna: 3, linha: 4);
      Campo c3 = Campo(coluna: 2, linha: 2);
      Campo c4 = Campo(coluna: 4, linha: 4);

      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);

      expect(c1.vizinhos.length, 3);
    });

    test("Adicionar NÃO vizinho", () {
      Campo c1 = Campo(coluna: 0, linha: 0);
      Campo c2 = Campo(coluna: 1, linha: 3);

      c1.adicionarVizinho(c2);

      expect(c1.vizinhos.isEmpty, isTrue);
    });

    test("Minas na vizinhança", () {
      Campo c1 = Campo(coluna: 3, linha: 3);

      Campo c2 = Campo(coluna: 3, linha: 4);
      c2.minar();

      Campo c3 = Campo(coluna: 2, linha: 2);

      Campo c4 = Campo(coluna: 4, linha: 4);
      c4.minar();

      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);

      expect(c1.qtdeMinasNaVizinhanca, 2);
    });
  });
}
