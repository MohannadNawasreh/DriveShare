import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
  }) async {
    return await dio.get(url);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return dio.post(url, data: data);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return dio.put(url, data: data);
  }

  static Future<Response> deleteData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return dio.delete(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
      data: data,
    );
  }
}
