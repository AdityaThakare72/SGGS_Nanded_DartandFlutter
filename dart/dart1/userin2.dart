import 'dart:io';

void main(List<String> arguments) {
  stdout.write("Enter your name: ");
  var name = stdin.readLineSync();

  // Parsing the input string to an integer
  int? marks = int.tryParse(name ?? "");

  if (marks != null) {
    print("Parsed Integer: $marks");
  } else {
    print("Invalid input. Could not parse to an integer.");
  }
}
