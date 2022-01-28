import 'dart:convert';
import 'package:http/http.dart' as http;

class QuotesAPI {
  // API key
  static const _apiKey = "e59e3db912msh8158f11e4623d38p1ab73ejsnd17a14cebd2f";
  // Base API url
  static const String _baseUrl = "bodybuilding-quotes1.p.rapidapi.com";
  // Base headers for Response url
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "bodybuilding-quotes1.p.rapidapi.com",
    "x-rapidapi-key": _apiKey,
  };

  // Base API request to get response
  Future<dynamic> get({
    required String endpoint,
  }) async {
    Uri uri = Uri.https(_baseUrl, endpoint);
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load json data');
    }
  }
}
