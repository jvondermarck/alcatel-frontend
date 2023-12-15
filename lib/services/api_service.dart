import 'dart:convert';

import 'package:pushtotalk/classes/bubble.dart';
import 'package:pushtotalk/interfaces/api.dart';
import 'package:http/http.dart' as http;

// Class used to communicate with backend

class ApiService implements Api {
  final String baseUrl = 'https://ptt-api.fr/bubbles';

  @override
  Future<http.Response> getBubbles() {
    return http.get(Uri.parse(baseUrl));
  }

  @override
  Future<http.Response> createBubble(Bubble bubble) {
    return http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(bubble),
    );
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
