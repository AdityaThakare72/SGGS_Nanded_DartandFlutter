import 'dart:io';

void main() {
  print("Enter a number: ");
  var number = stdin.readLineSync();
  var intNumber = int.parse(number ?? "-1");
  if (intNumber > 0) {
    print('Number is positive');
  } else {
    print('Number is negative');
  }
}
