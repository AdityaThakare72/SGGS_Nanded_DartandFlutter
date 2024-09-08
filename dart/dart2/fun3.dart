void main() {
  int x = 5;
  print('Factorial: ${factorial(x)}');
  int y = factorial(10);
  print('Factorial: $y');
}

int factorial(int n) {
  int fact = 1, i;
  for (i = 1; i <= n; i++) {
    fact = fact * i;
  }
  return fact;
}
