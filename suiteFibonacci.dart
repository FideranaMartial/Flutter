import 'dart:io';

void main(){
  var n;
  print("Entrez le nombre de termes de la suite de Fibonacci :");
  n = int.parse(stdin.readLineSync()!);

  List<int> fibonacci = [0, 1]; 

  for (int i = 2; i < n; i++) {
    int nextTerm = fibonacci[i - 1] + fibonacci[i - 2];
    fibonacci.add(nextTerm);
  }

  print(fibonacci);
}