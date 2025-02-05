class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}

final List<User> users = [
  User(username: "Mury", password: '123'),
  User(username: "John Doe", password: '123'),
];
