// Problem: Find addition of numbers from 1 to 10
void main() {
  var count = 1, sum = 0;
  while (count <= 10) {
    sum = sum + count;
    count++;
  }
  print('Addition is $sum');
}
