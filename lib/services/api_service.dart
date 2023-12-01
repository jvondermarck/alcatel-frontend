import 'package:pushtotalk/classes/bubble.dart';
import 'package:pushtotalk/interfaces/api.dart';
import 'package:http/http.dart' as http;

// Class used to communicate with backend

class ApiService implements Api {
  final String baseUrl = 'http://ptt-api.fr:3000/bubbles';

  @override
  Future<http.Response> getBubbles() {
    return http.get(Uri.parse(baseUrl));
  }

  @override
  Future<http.Response> createBubble(Bubble bubble) {
    // TODO: implement createBubble

    throw UnimplementedError();
  }

  @override
  Future deleteBubble() {
    // TODO: implement deleteBubble
    throw UnimplementedError();
  }

  @override
  Future updateBubble() {
    // TODO: implement updateBubble
    throw UnimplementedError();
  }
}
