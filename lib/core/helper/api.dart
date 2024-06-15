// import 'package:dio/dio.dart';

// class DioHelper {
//   static Dio? dio;

//   static init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: '', 
//         receiveDataWhenStatusError: true, // استقبال البيانات حتى عند حدوث خطأ في الحالة
//       ),
//     );
//   }

//   Future<Response> getData({
//     required String url,
//     Map<String, dynamic>? query,
//     String lang = 'en',
//     String? token,
//   }) async {
//     dio!.options.headers = {
//       'Content-Type': 'application/json',
//       'lang': lang,
//       'Authorization': token,
//     };
//     // إرسال الطلب GET
//     return await dio!.get(
//       url,
//       queryParameters: query,
//     );
//   }

//   Future<Response> postData({
//     required String url,
//     dynamic query,
//     required Map<String, dynamic> data,
//     String lang = 'en',
//     String? token,
//   }) async {
//     // إعداد الرؤوس للطلب POST
//     dio!.options.headers = {
//       'Content-Type': 'multipart/form-data', // تعيين نوع المحتوى ليكون multipart/form-data
//       'lang': lang,
//       'Authorization': token,
//     };

//     // تغليف البيانات في FormData
//     FormData formData = FormData.fromMap(data);
    
//     // إرسال الطلب POST
//     return await dio!.post(
//       url,
//       queryParameters: query,
//       data: formData, // استخدام FormData كبيانات للطلب
//     );
//   }

//   Future<Response> putData({
//     required String url,
//     dynamic query,
//     required Map<String, dynamic> data,
//     String lang = 'en',
//     String? token,
//   }) async {
//     // إعداد الرؤوس للطلب PUT
//     dio!.options.headers = {
//       'Content-Type': 'application/json',
//       'lang': lang,
//       'Authorization': token,
//     };
//     // إرسال الطلب PUT
//     return await dio!.put(
//       url,
//       queryParameters: query,
//       data: data,
//     );
//   }
// }

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
    String lang = 'ar',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    try {
      return await dio!.post(
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
