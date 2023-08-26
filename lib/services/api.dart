import 'package:http/http.dart' as http;

class Api {
  // ignore: constant_identifier_names
  static const String BASE_URL = "http://10.100.102.7:3000/api";

  static login(String email, String password) async {
    var url = Uri.parse("$BASE_URL/login");
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    return response;
  }

  static getUser(String id) async {
    var url = Uri.parse("$BASE_URL/users/$id");
    var response = await http.get(url);
    return response;
  }
}
