//leap year
import 'dart:io';

void main() {
  print("Enter a year: ");
  var userInput = stdin.readLineSync();
  var year = int.tryParse(userInput ?? "-1");

  if (year != null) {
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
      print('$year is a leap year.');
    } else {
      print('$year is not a leap year.');
    }
  } else {
    print('Invalid input or no value provided. Please enter a valid year.');
  }
}
