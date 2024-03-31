class User {
  final String name;
  int age;
  List<String>? professions;

  User({
    required this.name, 
    required this.age, 
    this.professions
  });
  
}