import 'dart:io';

import 'package:algoload_flutter_web_app/src/core/driver/interceptors.dart';
import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

@singleton
class NetworkDriver {
  NetworkDriver() : _dio = Dio();

  final Dio _dio;

  // TODO: move to env
  // static const String rootUrl = 'http://localhost:3001/';
  static const String rootUrl = 'https://algoload.parallel.ru/';

  void init() {
    _dio.options
      ..baseUrl = rootUrl
      ..followRedirects = true
      ..connectTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 5)
      ..validateStatus = (status) {
        return status != null && status > 0;
      }
      ..extra = {'withCredentials': true}
      ..headers = {
        if (!kIsWeb) HttpHeaders.userAgentHeader: 'dio',
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
      };

    if (kIsWeb) {
      // Включение withCredentials для Flutter Web
      (_dio.httpClientAdapter as BrowserHttpClientAdapter).withCredentials = true;
    }

    // TODO: глобально разобраться с отключением авторизации.
    // _dio.interceptors.add(AuthInterceptor());

    _dio.interceptors.add(InfoInterceptor());
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
    return _dio.post(url, data: body);
  }

  /// Sending a POST request with a file, created from string.
  /// On the current server, this request type has header.contentType = 'multipart/form-data'.
  /// The request body is passed to dio as an object of the FormData class.
  Future<Response> uploadFileFromString(
    String url, {
    required String fileName,
    required String fileFieldName,
    required String fileData,
    Map<String, dynamic> body = const {},
  }) async {
    final fileExtension = fileName.split('.').last;

    final data = <String, dynamic>{}
      ..addAll(body)
      ..addAll({
        fileFieldName: MultipartFile.fromString(
          fileData,
          filename: fileName,
          contentType: MediaType('multipart/form-data', fileExtension),
        ),
      });

    final formData = FormData.fromMap(data);
    return _dio.post(url, data: formData);
  }

  // todo: сейчас не работает из-за MultipartFile.fromFile
  /// Sending a POST request with a file.
  /// On the current server, this request type has header.contentType = 'multipart/form-data'.
  /// The request body is passed to dio as an object of the FormData class.
  Future<Response> uploadFile(
    String url, {
    required String filePath,
    required String fileFieldName,
    Map<String, dynamic> body = const {},
  }) async {
    final fileName = filePath.split('/').last;
    final fileExtension = filePath.split('.').last;

    final data = <String, dynamic>{}
      ..addAll(body)
      ..addAll({
        fileFieldName: await MultipartFile.fromFile(
          filePath,
          filename: fileName,
          contentType: MediaType('multipart/form-data', fileExtension),
        ),
      });

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
