import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/api.dart';

final userProvider = FutureProvider<AppUser>((ref) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return await Api.getUser(user.uid);
  }
  // handle null case as needed
  throw UnimplementedError("No user found");
});
