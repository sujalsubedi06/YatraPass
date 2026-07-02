class UserModel {
  final String id;
  final String phoneNumber;

  const UserModel({
    required this.id,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return UserModel(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
    );
  }
}