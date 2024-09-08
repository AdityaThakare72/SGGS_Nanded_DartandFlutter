void main() {
  // Creating a set of strings
  Set<String> countries = {'USA', 'Canada', 'Mexico', 'USA'};

  // Adding elements to the set
  countries.add('Brazil');
  countries.addAll({'Germany', 'Japan'});

  // Checking set length and contents
  print(
      "Number of countries: ${countries.length}"); // Output: Number of countries: 6

  // Iterating through the set
  print("All Countries:");
  for (String country in countries) {
    print(country);
  }
}
