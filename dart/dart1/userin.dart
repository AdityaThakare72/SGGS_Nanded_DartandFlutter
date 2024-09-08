import 'dart:io';

void main() {
  print("Enter a number..");
  var number = stdin.readLineSync();
  var intNumber = int.parse(number ?? "-1");
  print(intNumber * 10);
}
