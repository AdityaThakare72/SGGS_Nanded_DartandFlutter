void main() {
  int count = 1, sum = 0;
  do {
    sum = sum + count;
    count++;
  } while (count <= 10);

  print('Addition is $sum');
}
