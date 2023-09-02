import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swapit_app/models/wishlist_item.dart';

import '../models/user.dart';

class Api {
  // ignore: constant_identifier_names
  static const String BASE_URL = "http://10.100.102.7:3000/api";

  static Future<AppUser> getUser(String id) async {
    var url = Uri.parse("$BASE_URL/users/$id");
    var response = await http.get(url);
    return AppUser.fromJson(jsonDecode(response.body));
  }

  static getCategories() async {
    var url = Uri.parse("$BASE_URL/categories");
    var response = await http.get(url);
    return response.body;
  }

  static Future<List<WishListItem>> getWishList(String id) async {
    var url = Uri.parse("$BASE_URL/wishlists/$id");
    var response = await http.get(url);
    return Future.value((jsonDecode(response.body) as List)
        .map((e) => WishListItem.fromJson(e))
        .toList());
  }

  static uploadWishList(WishListItem item) async {
    var url = Uri.parse("$BASE_URL/wishlists/");
    String body = jsonEncode(item.toJson());

    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      return response.body;
    } catch (e) {
      // print(e);
    }
  }
}
