void main() {
  var list1 = [34, 67, 12, 39, 51, 76, 28, 47];
  int count;
  for (count = 0; count < list1.length; count++) {
    if (list1[count] % 2 == 1) {
      print(list1[count]);
    }
  }
}
