import 'dart:convert';
import 'dart:io';

import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_app_with_ai/src/core/driver/interceptors.dart';

@singleton
class NetworkDriver {
  NetworkDriver() : _dio = Dio();

  final Dio _dio;

  // TODO: move to env
  static const String rootUrl = 'http://localhost:3001/';
  // static const String rootUrl = 'https://algoload.parallel.ru/';

  void init() {
    _dio.options
      // ..extra = {
      //   'withCredentials': true,
      // }
      ..baseUrl = rootUrl
      // ..followRedirects = false
      ..connectTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 5)
      ..validateStatus = (status) {
        return status != null && status > 0;
      }
      ..headers = {
        HttpHeaders.userAgentHeader: 'dio',
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      };

    if (kIsWeb) {
      // Включение withCredentials для Flutter Web
      (_dio.httpClientAdapter as BrowserHttpClientAdapter).withCredentials = true;
    }

    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(InfoInterceptor());

    // todo: remove
    // dio.interceptors.add(InterceptorsWrapper(
    //   onResponse: (response, handler) {
    //     pprint('Response Headers: ${response.headers}');
    //     return handler.next(response);
    //   },
    // ));
  }

  Future<Response> get(String url) async {
    return _dio.get(url);
  }

  /// Sending a POST request. On the current server,
  /// this request type has header.contentType = 'application/json'.
  /// The body of the request is passed to dio as an object of the Map class.
  Future<Response> post(
    String url, {
    Map<String, dynamic> body = const {},
  }) async {
    // final rawData = <String, dynamic>{
    //   // 'clientToken': await _getAccessToken(),
    // }..addAll(body);
    // return dio.post(url, data: rawData);

    return _dio.post(url, data: body);
  }

  /// Sending a POST request with a file. On the current server,
  /// this request type has header.contentType = 'multipart/form-data'.
  /// The request body is passed to dio as an object of the FormData class.
  Future<Response> uploadFile(
    String url,
    String filePath, {
    Map<String, dynamic> body = const {},
  }) async {
    final fileName = filePath.split('/').last;
    final fileExtension = filePath.split('.').last;

    final rawData = <String, dynamic>{
      // 'clientToken': await _getAccessToken(),
    }..addAll(body);

    final data = <String, dynamic>{
      'jsonData': json.encode(rawData),
      'file': await MultipartFile.fromFile(
        filePath,
        filename: fileName,
        contentType: MediaType('audio/mpeg', fileExtension),
      ),
    };

    final formData = FormData.fromMap(data);
    return _dio.post(url, data: formData);
  }

  // static Future<String> _getAccessToken() async {
  //   final storage = inject<SecureStorageService>();
  //   final accessToken = await storage.getValue<String>(SecureStorageConstants.accessTokenKey);
  //   if (accessToken != null && accessToken.isNotEmpty) {
  //     return accessToken;
  //   }
  //   return 'null';
  // }
}
