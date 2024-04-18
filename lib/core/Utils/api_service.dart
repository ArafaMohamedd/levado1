import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://levado-ecommerce-api.onrender.com/api/v1/";
  final Dio dio;
  ApiService(this.dio);

  Future<Map<String, dynamic>> getMap({required String endpoint,Map<String, dynamic>? queryParams}) async {
    var response = await dio.get('$_baseUrl$endpoint',queryParameters:queryParams );
    return response.data;
  }
  Future<List<dynamic>> getList({required String endpoint ,Map<String, dynamic>? queryParams}) async {
    var response = await dio.get('$_baseUrl$endpoint',queryParameters:queryParams );
    return response.data;
  }


  Future<List<dynamic>> getUsingHeaders({required String endpoint,required Map<String, String> headers }) async {
    var response = await dio.get('$_baseUrl$endpoint',options: Options(headers: headers));
    return response.data;
  }

  Future<Map<String,dynamic>> getMapUsingHeaders({required String endpoint,required Map<String, String> headers }) async {
    var response = await dio.get('$_baseUrl$endpoint',options: Options(headers: headers));
    return response.data;
  }

  Future postResponse({
    required String endpoint,
    required Map<String, dynamic> data,
    Options? options,
  }) async {
    final response = await dio.post(
      '$_baseUrl$endpoint',
      data: data,
      options: options,
    );
    return response;
  }


  Future<Map<String, dynamic>> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
    final response = await dio.post('$_baseUrl$endpoint', data: data,);
    return response.data;
  }

  Future<Map<String, dynamic>> patch(
      {required String endpoint, required Map<String, dynamic> data}) async {
    final response = await dio.patch('$_baseUrl$endpoint', data: data,);
    return response.data;
  }



  Future<Map<String, dynamic>> postUsingHeaders(
      {required String endpoint, required FormData data,required Map<String, String> headers}) async {
    final response = await dio.post('$_baseUrl$endpoint', data: data,options: Options(headers: headers),);
    return response.data;
  }

  Future<Map<String, dynamic>> postMapUsingHeaders(
      {required String endpoint, required  var  data,required Map<String, String> headers}) async {
    final response = await dio.post('$_baseUrl$endpoint', data: data,options: Options(headers: headers),);
    return response.data;
  }
  Future<String> postStringUsingHeaders(
      {required String endpoint, required  var  data,required Map<String, String> headers}) async {
    final response = await dio.post('$_baseUrl$endpoint', data: data,options: Options(headers: headers),);
    return response.data;
  }


  Future<Map<String, dynamic>> putUsingHeaders(
      {required String endpoint, required FormData data,required Map<String, String> headers}) async {
    final response = await dio.post('$_baseUrl$endpoint', data: data,options: Options(headers: headers),);
    return response.data;
  }



  Future delete({
    required String endpoint,
   }) async {

      final response = await dio.delete('$_baseUrl$endpoint',);
    //  return response.data;

  }





}
