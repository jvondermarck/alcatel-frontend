class RainbowUser {
  final String id;
  final String firstName;
  final String lastName;
  final String companyName;
  final String email;
  final String? jobTitle;

  RainbowUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.email,
    required this.jobTitle,
  });

  factory RainbowUser.fromJson(Map<String, dynamic> json) {
    return RainbowUser(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      companyName: json['company'],
      email: json['email'],
      jobTitle: json['jobTitle'],
    );
  }

  factory RainbowUser.fromMap(Map<Object?, Object?> map) {
    return RainbowUser(
      id: map['id'].toString(),
      firstName: map['firstName'].toString(),
      lastName: map['lastName'].toString(),
      companyName: map['companyName'].toString(),
      email: map['email'].toString(),
      jobTitle: map['jobTitle'].toString(),
    );
  }
}
