import 'package:riverpod/riverpod.dart';

import '../models/user.dart';
// import '../services/api.dart';

final userProvider = Provider<User>(
  (ref) {
    return User(
      'uid',
      1,
      'userName',
      DateTime.now(),
      DateTime.now(),
      'userStatus',
    );
  },
);
