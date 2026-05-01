int plusGrandeDifferenceConsecutive(List<int> nombres) {
  if (nombres.length < 2) {
    return 0;
  }

  int maxDiff = 0;
  for (var i = 1; i < nombres.length; i++) {
    int diff = (nombres[i] - nombres[i - 1]).abs();
    if (diff > maxDiff) {
      maxDiff = diff;
    }
  }

  return maxDiff;
}

void main() {
  final nombres = [1, 3, 8, 2, 5];
  final result = plusGrandeDifferenceConsecutive(nombres);
  print(result);
}