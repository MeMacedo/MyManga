import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

abstract class RequestServices {
  Future<dynamic> get(String url);

  Future<dynamic> post(String url, dynamic body);
}

class DioService extends RequestServices {
  @override
  Future get(String url) {
    Dio().get(url);
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future post(String url, dynamic body) {
    Dio().post(url, data: body);
    return Future.delayed(const Duration(seconds: 2));
  }
}

class HttpService extends RequestServices {
  @override
  Future get(String url) {
    http.Client().get(Uri.parse(url));
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future post(String url, dynamic body) {
    http.Client().post(Uri.parse(url), body: body);
    return Future.delayed(const Duration(seconds: 2));
  }
}
