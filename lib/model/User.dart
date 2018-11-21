import 'dart:math';

class User {
  static var UserIndex = 0;
  var name;
  var age;

  User(this.name, this.age);

  static User CreateRandom() {
    var rng = Random();
    var number = rng.nextInt(87) + 13;
    return User("user  ${++UserIndex}", number);
  }
}
