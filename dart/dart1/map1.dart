void main() {
  // Creating a map with keys as strings and values as integers
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 28,
  };

  // Adding a new entry to the map
  ages['David'] = 35;

  // Accessing values by key
  print("Alice's Age: ${ages['Alice']}"); // Output: Alice's Age: 25

  // Iterating through the map
  print("All Entries:");
  ages.forEach((key, value) {
    print("$key: $value");
  });
}
