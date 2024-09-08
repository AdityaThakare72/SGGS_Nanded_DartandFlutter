void main() {
  int a = 10;
  int b = 4;

  int sum = a + b; // Addition
  print("Sum: $sum"); // Output: Sum: 14

  // Relational
  int x = 5;
  int y = 10;

  bool isEqual = x == y; // Equality check
  print("Is Equal: $isEqual"); // Output: Is Equal: false

  bool isNotEqual = x != y; // Inequality check
  print("Is Not Equal: $isNotEqual"); // Output: Is Not Equal: true

  // Logical
  bool isSunny = true;
  bool isWarm = false;

  bool isGoodWeather = isSunny && isWarm; // Logical AND
  print("Is Good Weather: $isGoodWeather"); // Output: Is Good Weather: false

  bool isEitherSunnyOrWarm = isSunny || isWarm; // Logical OR
  print(
      "Is Either Sunny or Warm: $isEitherSunnyOrWarm"); // Output: Is Either Sunny or Warm: true

  bool isNotSunny = !isSunny; // Logical NOT
  print("Is Not Sunny: $isNotSunny"); // Output: Is Not Sunny: false
}
