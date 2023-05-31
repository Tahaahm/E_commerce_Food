// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class SignUpBody {
  String name;
  String phone;
  String email;
  String password;
  SignUpBody(
      {required this.email,
      required this.name,
      required this.password,
      required this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["f_name"] = this.name;
    data["phone"] = this.phone;
    data["email"] = this.email;
    data["password"] = this.password;

    return data;
  }
}
