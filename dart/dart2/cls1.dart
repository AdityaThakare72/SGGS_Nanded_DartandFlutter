// Defining class
class Student {
  var stdName;
  var stdAge;
  var stdRoll_nu;

  // Class Function
  showStdInfo() {
    print("Student Name is : ${stdName}");
    print("Student Age is : ${stdAge}");
    print("Student Roll Number is : ${stdRoll_nu}");
  }
}

void main() {
  // Creating Object called std
  var std = new Student();
  std.showStdInfo();
}
