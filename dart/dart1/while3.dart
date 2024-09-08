// Problem: Find addition of first 10 odd numbers
// Addition of odd numbers from 1 to 20.
void main() {
  var count = 1, sum = 0, oddCount = 0;

  while (oddCount < 10) {
    if (count % 2 == 1) {
      sum += count;
      oddCount++;
    }
    count++;
  }

  print('Addition of first 10 odd numbers is $sum');
}
