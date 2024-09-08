void main() {
  int x = 78, y = 29;
  larger(x, y); // x, y are actual arguments
}

void larger(int n, int m) {
  // m, n formal arguments
  if (n > m) {
    print('$n is larger');
  } else {
    print('$m is larger');
  }
}
