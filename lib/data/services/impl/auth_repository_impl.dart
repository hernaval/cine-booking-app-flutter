import 'package:i_cine_app/models/auth.dart';
import 'package:i_cine_app/models/user.dart';

import '../../repositories/auth_repository.dart';
import '../local_service.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final LocalService _localService;


  AuthRepositoryImpl(this._localService);


  @override
  Future<User> login(Auth auth) async {
    // TODO: implement login
    var payload = auth.toMap();

    return await User.fromMap(await _localService.insert(payload));
  }

}