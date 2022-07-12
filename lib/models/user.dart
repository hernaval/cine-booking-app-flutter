class User {
  final String id;
  final String fullname;
  final String email;
  final String? accessToken;

  User({this.id="", required this.fullname,  required this.email, this.accessToken});

  User.fromMap(Map<String, dynamic> data ) :
        id = data['id'],
        fullname = data['fullname'],
        email = data['email'],
        accessToken = data['accessToken']
  ;

  @override
  String toString() {
    return "id: $id, fullname: $fullname";
  }
}