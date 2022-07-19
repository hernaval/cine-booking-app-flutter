class Auth {
  final String email;
  final String password;

  Auth(this.email, this.password);
  
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}