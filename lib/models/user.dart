class User {
  final String username;
  final String email;
  final String password;

  User({required this.email, required this.username, required this.password});
}

final List<User> users = [
  User(email: "mury@gmail.com", username: "Mury", password: '123'),
  User(email: "john@gmail.com", username: "John Doe", password: '123'),
];
