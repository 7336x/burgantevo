import 'package:burgantevo/models/user.dart';
import 'package:burgantevo/services/client.dart';
import 'package:dio/dio.dart';

class AuthServices {
  Future<Map<String, String>> signupAPI({required User user}) async {
    try {
      Response response = await dio.post('/auth/signup', data: user.toJson());
      return {'token': response.data["token"]};
    } on DioException catch (error) {
      print(error.response!.data["error"]["message"]);
      return {'error': error.response!.data["error"]["message"]};
    }
  }

  Future<String> loginApi({required User user}) async {
    late String token;
    try {
      // print(user.toJson());
      Response response = await dio.post('/auth/signin', data: user.toJson());
      token = response.data["token"];
      // print(token);
    } on DioException catch (error) {
      print(error.response!);
      return error.response!.data["error"]["message"];
    }
    return token;
  }
}
