
import 'dart:io';
import 'dart:math';

void main() {

  List<String> palavras = ['caule','tiros'];
  String sorteio = palavras[Random().nextInt(palavras.length)];
  List<String> letrasCorretas = sorteio.split('');
  int tentativas = 6;
  bool isGameOn = true;


  int i = 0;
  int x = 0;

  print('\t\tTermo');

  while (isGameOn) {

    print('\n$tentativas Tentativas disponíveis.');
    print('Digite uma palavra:');
    String? palavraTeste = stdin.readLineSync();

    List<String> resultado = [];
    

    if (palavraTeste != null && palavraTeste.length == 5){
      
      List<String> letrasTeste = palavraTeste.split('');

      if(palavraTeste == sorteio){
        print("\nPalavra Correta");
        isGameOn = false;
      }else{

        letrasTeste.forEach((letra) { 
        letrasCorretas.forEach((letraCorreta) { 
          if(letra == letraCorreta){
            resultado.add("[$letra]");
          }else if((sorteio.contains(letra)) && (letra != letraCorreta)){
            resultado.add("($letra)");
          }else{
            resultado.add(letra);
          }
        });
      });

      for(i = 0; i < resultado.length; i++){
        print(resultado[i]);
      }

      }

      tentativas --;

    }else{
      print('\n Palavra Inválida, tente uma com 5 letras !');
    }
    
  }
}
