import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelpers {
  NetworkHelpers(this.url, {this.headers, this.body});

  final String url;
  final dynamic body;
  Map<String, String>? headers;

  Future getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      print(response.body);

      if (response.statusCode != 200) throw jsonDecode(response.body);

      return jsonDecode(response.body);
    } catch (e) {
      print("dari error $e");
      throw e;
    }
  }
}
