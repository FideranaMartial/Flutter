String transformerChaine(String input) {
  // Extraire tous les chiffres et inverser leur ordre
  final digits = input
      .split('')
      .where((c) => RegExp(r'^[0-9]$').hasMatch(c))
      .toList()
      .reversed
      .toList();

  var digitIndex = 0;
  final buffer = StringBuffer();

  for (final char in input.split('')) {
    if (RegExp(r'^[A-Z]$').hasMatch(char)) {
      buffer.write(char.toLowerCase());
    } else if (RegExp(r'^[a-z]$').hasMatch(char)) {
      buffer.write(char.toUpperCase());
    } else if (RegExp(r'^[0-9]$').hasMatch(char)) {
      buffer.write(digits[digitIndex]);
      digitIndex += 1;
    } else {
      buffer.write(char);
    }
  }

  return buffer.toString();
}

void main() {
  final input = "Hello World! 123";
  final result = transformerChaine(input);
  print(result);
}
