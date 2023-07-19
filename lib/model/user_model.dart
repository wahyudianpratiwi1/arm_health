class User {
  String? id;
  String? fullName;
  String? email;
  String? createPassword;
  String? confirmPassword;

  User({
    this.id,
    this.fullName,
    this.email,
    this.createPassword,
    this.confirmPassword,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        createPassword: json["create_password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "create_password": createPassword,
        "confirm_password": confirmPassword,
      };
}
