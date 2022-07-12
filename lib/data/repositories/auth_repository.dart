import 'package:i_cine_app/models/user.dart';

import '../../models/auth.dart';

abstract class IAuthRepository {
  Future<User> login(Auth auth);
}