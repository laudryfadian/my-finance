class User {
  String nama;
  String email;
  String password;
  String nim;

  User(
      {required this.nama,
      required this.email,
      required this.password,
      required this.nim});

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'email': email,
      'password': password,
      'nim': nim,
    };
  }
}
