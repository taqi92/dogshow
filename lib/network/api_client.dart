
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../utils/constants.dart';
import '../utils/endpoints.dart';
import '../utils/environment.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient apiClient = ApiClient._internal();
  late Dio _dio;

  ApiClient._internal() {
    var options = BaseOptions(
      baseUrl: getBaseUrl(),
    );
    _dio = Dio(options);
  }


  void getRequest(
    String url,
    ResponseCallback<dynamic, String?> callback, {
    bool checkStatusCodeOnly = false,
  }) async {
    try{
      final apiResponse = await client.get(
        url,
      );

      var responseData = apiResponse.data;
      if (apiResponse.statusCode == 200) {
        callback(responseData, null);
      }else if (apiResponse.statusCode == 201) {
        callback(responseData, null);
      }else if (apiResponse.statusCode == 204) {
        callback(null, "$responseData");
      } else {
        callback(null, "$responseData");
      }
    } on DioError catch (e) {
      callback(null, _getDioErrorResponse(e));
    } on FormatException catch (e) {
      callback(null, e.toString());
    } catch (e) {
      callback(null, "$e");
    }
  }

  void _getActualResponse(
      dynamic response, Function(dynamic, String?) callback) {
    if (response['success'] == true) {
      callback(response, null);
    } else {
      callback(null, response['message']);
    }
  }

  String _getErrorMessage(Response<dynamic> apiResponse) {
    var responseData = apiResponse.data;

    if (responseData != null && responseData != "") {
      String errorText = "";
      var errors = "${apiResponse.data}".split("\n");

      for (int i = 0; i < errors.length; i++) {
        if (i < 12) errorText += errors[i];
      }

      return errorText;
    } else {
      return "${apiResponse.statusMessage}";
    }
  }

  String? _getDioErrorResponse(DioError e) {
    var response = e.response;
    var statusCode = response?.statusCode;

    if (response?.data != null) {
      try {
        if (statusCode != null && statusCode == 401 ||
            statusCode == 403 ||
            statusCode! >= 500) {
          if (statusCode! >= 500) {
            return "Internal Server Error: $statusCode";
          } else {
            /*ErrorResponse errorResponse = ErrorResponse.fromJson(response?.data);
            var message = errorResponse.error?.message;
            return message != null && message.isNotEmpty
                ? message
                : errorResponse.error?.message;*/
          }
        } else {}
      } catch (e) {
        return e.toString();
      }
    } else {
      return e.message;
    }
  }

  Dio get client {
    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          var connectivityResult = await (Connectivity().checkConnectivity());
          if (connectivityResult == ConnectivityResult.none) {
            return handler.reject(
                DioError(
                    requestOptions: options,
                    error: "internet connectivity problem"),
                true);
          }

        } catch (e) {
          return handler.reject(
              DioError(
                  requestOptions: options, error: "Error: ${e.toString()}"),
              true);
        }

        options.headers.addAll({
          "Content-type": "application/json",
          "accept": "application/json,text/plain"
        });
        return handler.next(options);
      },
      onError: (error, handler) async {
        var errorResponse = error.response;
        RequestOptions? requestOptions = errorResponse?.requestOptions;

        if (errorResponse?.statusCode == 403) {

          try {
            var newDio = Dio();

            if (kDebugMode) {
              newDio.interceptors.clear();
              newDio.interceptors.add(LogInterceptor(
                error: true,
                request: true,
                requestBody: true,
                responseBody: true,
                requestHeader: true,
                logPrint: (object) {
                  log(object.toString());
                },
              ));
            }
          } catch (e) {
            return handler.next(error);
          }
        }

        return handler.next(error);
      },
    ));

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        logPrint: (object) {
          log(object.toString());
        },
      ));
    }

    return _dio;
  }

}

extension _AsOptions on RequestOptions {
  Options asOptions() {
    return Options(
      method: method,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      extra: extra,
      headers: headers,
      responseType: responseType,
      contentType: contentType,
      validateStatus: validateStatus,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      listFormat: listFormat,
    );
  }
}
