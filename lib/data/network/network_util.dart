import 'package:http/http.dart' as http;

class NetworkUtil {
  Future<http.Response> get(String url) {
    return http.get(Uri.parse(url));
  }
}
