import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://nouraapi.runasp.net/api/', 
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    try {
      return await dio!.get(
        url,
        queryParameters: query,
      );
    } on DioError catch (e) {
      // معالجة الأخطاء وعرض رسالة مناسبة للمستخدم
      print('Error: ${e.response?.statusCode} - ${e.message}');
      throw e; // إعادة رمي الاستثناء للتعامل معه في مكان آخر إذا لزم الأمر
    }
  }

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    bool isMultipart = false,
    String lang = 'ar',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': isMultipart ? 'multipart/form-data' : 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    try {
      return await dio!.post(
        url,
        queryParameters: query,
        data: isMultipart ? FormData.fromMap(data) : data,
      );
    } on DioError catch (e) {
      // معالجة الأخطاء وعرض رسالة مناسبة للمستخدم
      print('Error: ${e.response?.statusCode} - ${e.message}');
      throw e; // إعادة رمي الاستثناء للتعامل معه في مكان آخر إذا لزم الأمر
    }
  }

  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    try {
      return await dio!.put(
        url,
        queryParameters: query,
        data: data,
      );
    } on DioError catch (e) {
      // معالجة الأخطاء وعرض رسالة مناسبة للمستخدم
      print('Error: ${e.response?.statusCode} - ${e.message}');
      throw e; // إعادة رمي الاستثناء للتعامل معه في مكان آخر إذا لزم الأمر
    }
  }
}
