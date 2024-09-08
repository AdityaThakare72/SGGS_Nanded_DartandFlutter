class Person {
  // Class name
  var name;
  var age;
  var weight; // Instance variables
  Person() {
    // default constructor
    name = 'Pramod';
    age = 40;
    weight = 67.24;
  }

  void show() {
    // Function or method
    print('Name: $name');
    print('Age: $age');
    print('Weigth: $weight');
  }
}

void main() {
  var obj1 = new Person(); // Create the object
  obj1.show(); // access the method of class

  var obj2 = new Person(); // Object-2
  obj2.show();
}
