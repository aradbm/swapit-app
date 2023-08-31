import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapit_app/models/category.dart';
import '../services/api.dart';

final categoriesProvider = FutureProvider<List<ItemCategory>>((ref) async {
  final response = await Api.getCategories();
  final categories = json.decode(response);

  return compute(parseCategories, categories);
});
FutureOr<List<ItemCategory>> parseCategories(message) {
  final parsed = message.cast<Map<String, dynamic>>();
  return parsed
      .map<ItemCategory>((json) => ItemCategory.fromJson(json))
      .toList();
}
