// Find factorial of number
void main() {
  int num = 5, fact = 1, i;
  for (i = 1; i <= num; i++) {
    fact = fact * i;
  }
  print('Factorial $fact');
}
