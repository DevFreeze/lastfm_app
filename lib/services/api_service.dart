import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<Map> get(Uri uri) async {
    final _response = await http.get(uri);

    if (_response.statusCode == 200) {
      return jsonDecode(_response.body);
    } else {
      throw Exception();
    }
  }
}
