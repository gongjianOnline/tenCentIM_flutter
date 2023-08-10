import 'package:dio/dio.dart';

class MyHttp {
  late Dio _dio;

  MyHttp() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://192.168.3.18:3002',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    _dio = Dio(options);
  }

  Future<T> get<T>(String path, {Map<String, dynamic> ?queryParameters, String ?token}) async {
    try {
      Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<T> post<T>(String path, {Map<String, dynamic> ?data, String ?token}) async {
    try {
      Response response = await _dio.post(
        path,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<T> upload<T>(String path, String filePath, {String ?token}) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
      });
      Response response = await _dio.post(
        path,
        data: formData,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          contentType: 'multipart/form-data',
        ),
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  dynamic _handleError(dynamic e) {
    if (e is DioException) {
      if (e.response != null) {
        // 请求成功，但服务器返回错误状态码
        throw BadRequestException(e.response!.data['message']);
      } else {
        // 请求失败，网络异常等
        throw BadRequestException("请求失败,网络异常");
      }
    } else {
      throw e;
    }
  }


}

class BadRequestException implements Exception {
  final String message;

  BadRequestException(this.message);

  @override
  String toString() {
    return message;
  }
}