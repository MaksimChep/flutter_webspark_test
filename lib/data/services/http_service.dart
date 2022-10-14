import 'dart:convert';

import 'package:flutter_webspark_test/data/models/result_entity.dart';
import 'package:flutter_webspark_test/data/models/static_values.dart';
import 'package:http/http.dart' as http;

/// It's a class that has two methods, one that gets a response from a server and one that posts a
/// response to a server
class HttpService {
  Future<Map<String, dynamic>> getResponseBody() async {
    http.Response response = await http.get(Uri.parse(StaticValues.url));
    return jsonDecode(response.body);
  }

  Future<int> postResponse(List<FullResult> results) async {
    http.Response response = await http.post(Uri.parse(StaticValues.url),
        headers: {"Content-type": "application/json"},
        body: json.encode(List<dynamic>.from(results.map((x) => x.toJson()))));

    return response.statusCode;
  }
}
