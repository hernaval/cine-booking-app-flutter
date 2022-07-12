class Auth {
  final String username;
  final String password;

  Auth(this.username, this.password);
  
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }
}