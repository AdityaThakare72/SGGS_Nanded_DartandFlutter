class Person {
  // Class name
  var name;
  var age;
  var weight; // Instance variables

  void show() {
    // Function or method
    print('Name: $name');
    print('Age: $age');
    print('Weigth: $weight');
  }
}

void main() {
  var obj1 = new Person(); // Create the object
  obj1.name = 'Ajay'; // access the properties of class
  obj1.age = 28;
  obj1.show(); // access the method of class

  var obj2 = new Person(); // Object-2
  obj2.name = 'Kiran';
  obj2.weight = 56.12;
  obj2.show();
}
