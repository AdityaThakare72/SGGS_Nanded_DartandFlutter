// Write a function to find largest number among three
void main() {
  int a = 45, b = 67, c = 28;
  print('Largest: ${largest(a, b, c)}');
}

int largest(int x, int y, int z) {
  if (x > y && x > z)
    return x;
  else if (y > x && y > z)
    return y;
  else
    return z;
}
