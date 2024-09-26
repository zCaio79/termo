import 'dart:io';
import 'dart:math';

void main() {
  List<String> palavras = ['caule', 'tiros'];
  String sorteio = palavras[Random().nextInt(palavras.length)];
  List<String> letrasCorretas = sorteio.split('');
  int tentativas = 6;
  bool isGameOn = true;

  print('\t\tTermo');

  while (isGameOn && (tentativas > 0)) {
    print('\n$tentativas Tentativas disponíveis.');
    print('Digite uma palavra:');
    String? palavraTeste = stdin.readLineSync();

    if (palavraTeste != null && palavraTeste.length == 5) {
      List<String> letrasTeste = palavraTeste.split('');
      List<String> resultado = ['', '', '', '', ''];

      if (palavraTeste == sorteio) {
        print("\nPalavra Correta");
        isGameOn = false;
      } else {
        for (int i = 0; i < 5; i++) {
          if (letrasTeste[i] == letrasCorretas[i]) {
            resultado[i] = "[${letrasTeste[i]}]";
          } else if (sorteio.contains(letrasTeste[i])) {
            resultado[i] = "(${letrasTeste[i]})";
          } else {
            resultado[i] = letrasTeste[i];
          }
        }

        print(resultado.join(' '));
      }

      tentativas--;
    } else {
      print('\nPalavra Inválida, tente uma com 5 letras!');
    }
  }

  if (!isGameOn) {
    print("\nParabéns, você venceu!");
  } else {
    print("\nFim de Jogo. A palavra correta era: $sorteio");
  }
}
