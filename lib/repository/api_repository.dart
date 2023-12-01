// Class responsible to communicate with api_service.dart

import 'package:pushtotalk/interfaces/api.dart';
import 'package:pushtotalk/classes/bubble.dart';
import 'package:pushtotalk/services/api_service.dart';

class ApiRepository implements Api {
  ApiService apiService = ApiService();

  @override
  Future createBubble(Bubble bubble) {
    throw UnimplementedError();
  }

  @override
  Future deleteBubble() {
    // TODO: implement deleteBubble
    throw UnimplementedError();
  }

  @override
  Future getBubbles() {
    return apiService.getBubbles();
  }

  @override
  Future updateBubble() {
    // TODO: implement updateBubble
    throw UnimplementedError();
  }
}
