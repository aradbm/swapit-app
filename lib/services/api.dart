import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swapit_app/models/backpack_item.dart';
import 'package:swapit_app/models/wishlist_item.dart';

import '../models/user.dart';

class Api {
  // ignore: constant_identifier_names
  static const String BASE_URL = "http://127.0.0.1:3000/api";
  // static const String BASE_URL = "http://10.100.102.7:3000/api";

  static Future<AppUser> getUser(String uid) async {
    var url = Uri.parse("$BASE_URL/users/$uid");
    var response = await http.get(url);
    return AppUser.fromJson(jsonDecode(response.body));
  }

  static getCategories() async {
    var url = Uri.parse("$BASE_URL/categories");
    var response = await http.get(url);
    return response.body;
  }
  ////// Backpack API calls: //////

  // get backpack items for a user with a specific id
  // returns a list of BackPackItem objects
  static getBackPack(String uid) async {
    var url = Uri.parse("$BASE_URL/backpacks/$uid");
    var response = await http.get(url);
    return (jsonDecode(response.body) as List)
        .map((e) => BackPackItem.fromJson(e))
        .toList();
  }

  // publish a new backpack item
  static uploadBackPack(BackPackItem item) async {
    var url = Uri.parse("$BASE_URL/backpacks/");
    String body = jsonEncode(item.toJson());

    try {
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      return response.body;
    } catch (e) {
      // print(e);
    }
  }

  // update an existing backpack item
  static updateBackPack(BackPackItem item) async {
    var url = Uri.parse("$BASE_URL/backpacks/${item.itemid}");
    String body = jsonEncode(item.toJson());

    try {
      var response = await http.put(url,
          headers: {"Content-Type": "application/json"}, body: body);
      return response.body;
    } catch (e) {
      // print(e);
    }
  }

  // delete an existing backpack item

  static deleteBackPack(BackPackItem item) async {
    var url = Uri.parse("$BASE_URL/backpacks/${item.itemid}");

    try {
      var response = await http.delete(url);
      return response.body;
    } catch (e) {
      // print(e);
    }
  }

  ////// Wishlist API calls: //////

  // get wishlist items for a user with a specific id
  static getWishList(String uid) async {
    var url = Uri.parse("$BASE_URL/wishlists/$uid");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => WishListItem.fromJson(e))
          .toList();
    } else {
      // return epty list of items
      return <WishListItem>[];
    }
  }

  static uploadWishList(WishListItem item) async {
    var url = Uri.parse("$BASE_URL/wishlists/");
    String body = jsonEncode(item.toJson());

    try {
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      return response.body;
    } catch (e) {
      // print(e);
    }
  }

  static Future<String> updateWishList(WishListItem item) async {
    var url = Uri.parse("$BASE_URL/wishlists/${item.itemid}");
    String body = jsonEncode(item.toJson());

    try {
      var response = await http.put(url,
          headers: {"Content-Type": "application/json"}, body: body);
      return response.body;
    } catch (e) {
      // print(e);
    }

    return "";
  }

  static deleteWishList(WishListItem item) async {
    var url = Uri.parse("$BASE_URL/wishlists/${item.itemid}");

    try {
      var response = await http.delete(url);
      return response.body;
    } catch (e) {
      // print(e);
    }
  }
}
