import 'package:create_app/data/service/base_service.dart';

import '../model/user.dart';

class GetAllUserService extends ServiceBase<List<User>> {
  @override
  Future<List<User>> call() async {
    final result = await get('user');
    return List.generate(
        result['data'].length, (index) => User.fromJson(result['data'][index]));
  }
}
