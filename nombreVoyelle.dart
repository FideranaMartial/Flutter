import 'dart:io';

void main(){
  var phrase;
  int nombreVoyelle = 0;
  print("Ecriver votre phrase: ");
  phrase = stdin.readLineSync();
  for (int i = 0; i < phrase.length;i++){
    if (phrase[i] == 'a' || phrase[i] == 'e' || phrase[i] == 'i' || phrase[i] == 'o' || phrase[i] == 'u' || phrase[i] == 'y' ||
        phrase[i] == 'A' || phrase[i] == 'E' || phrase[i] == 'I' || phrase[i] == 'O' || phrase[i] == 'U' || phrase[i] == 'Y') {
      nombreVoyelle++;
    }
  }
  print("Le nombre de voyelles dans la phrase est: $nombreVoyelle");
}