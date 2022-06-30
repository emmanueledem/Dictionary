import 'package:http/http.dart' as http;

class HttpService {
  static const baseUrl = 'https://api.dictionaryapi.dev/api/v2/entries/';

  static Future<http.Response> getRequest(endpoint) async {
    http.Response response;
    final url = Uri.parse("$baseUrl$endpoint");

    try {
      response = await http.get(url);
    } catch (e) {
      print(e);
      rethrow;
    }

    return response;
  }
}
