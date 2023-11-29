abstract class Api {
  // test
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, dynamic body);
}
