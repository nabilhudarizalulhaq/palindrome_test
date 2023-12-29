
class Users {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const Users({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
  });

  factory Users.fromJson(Map<dynamic, dynamic> json)
    => Users(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  
}
