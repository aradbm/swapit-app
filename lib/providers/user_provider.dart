import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/api.dart';

final userProvider = FutureProvider<User>((ref) async {
  final response = await Api.getUser('1');
  final user = User.fromJson(json.decode(response));
  return user;
});
