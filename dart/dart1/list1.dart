void main() {
  // Creating a list of integers
  List<int> numbers = [1, 2, 3, 4, 5];

  // Adding elements to the list
  numbers.add(6);
  numbers.addAll([7, 8]);

  // Accessing elements by index
  print("First Element: ${numbers[0]}"); // Output: First Element: 1

  // Iterating through the list
  print("All Elements:");
  for (int number in numbers) {
    print(number);
  }
}
