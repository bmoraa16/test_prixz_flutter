import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:notification_center/notification_center.dart';
import 'package:prueba_prix/core/error.dart';

enum RequestType { get, post }

class Request {
  final String url;
  final Object? body;
  final RequestType method;

  Request({required this.url, this.body, required this.method});
}

@injectable
class NetworkManager {
  Future<Map<String, String>> headers({bool isFile = false}) async {
    final contentType = isFile ? "multipart/form-data" : "application/json";
    return {
      "Accept": "application/json",
      "Content-Type": contentType,
      "App-Device":
          defaultTargetPlatform == TargetPlatform.android ? "Android" : "iOS",
    };
  }

  Future<Result<T, HBError>> call<T>({
    required Request request,
    required String errorMsg,
    required T Function(Map<String, dynamic> response) mapper,
  }) async {
    final result = await _performRequest(
      request: request,
      errorMsg: errorMsg,
    );

    return result.when(
      (success) => _handleResponse(success, errorMsg, mapper),
      (error) => Result.error(error),
    );
  }

  Future<Result<http.Response, HBError>> _performRequest({
    required Request request,
    List<http.MultipartFile>? files,
    bool isMultipart = false,
    bool isDownload = false,
    required String errorMsg,
  }) async {
    if (await InternetConnectionChecker.createInstance().hasConnection) {
      if (kDebugMode && request.body != null) {
        log("Request body of ${request.url}");
        log(request.body.toString());
        log("===================================================");
      }

      try {
        http.Response response;

        if (isMultipart && files != null) {
          final multipartRequest = http.MultipartRequest(
            'POST',
            Uri.parse(request.url),
          );
          multipartRequest.headers.addAll(await headers(isFile: true));
          multipartRequest.files.addAll(files);

          if (request.body != null) {
            final fields = request.body as Map<String, dynamic>;
            fields
                .forEach((key, value) => multipartRequest.fields[key] = value);
          }

          response = await multipartRequest.send().then((res) async {
            final responseBody = await res.stream.bytesToString();
            return http.Response(responseBody, res.statusCode);
          });
        } else {
          switch (request.method) {
            case RequestType.get:
              response = await http
                  .get(
                    Uri.parse(request.url),
                    headers: await headers(),
                  )
                  .timeout(
                    const Duration(seconds: 60),
                    onTimeout: () => onTimeoutError(),
                  )
                  .catchError((onError) => onError);
              break;
            case RequestType.post:
              response = await http
                  .post(
                    Uri.parse(request.url),
                    headers: await headers(),
                    body: jsonEncode(request.body),
                  )
                  .timeout(
                    const Duration(seconds: 60),
                    onTimeout: () => onTimeoutError(),
                  )
                  .catchError((onError) => onError);
              break;
            default:
              return const Result.error(HBError(errorType: ErrorType.unknown));
          }
        }

        if (kDebugMode && !isDownload) {
          log("Response body of ${request.url}");
          log(response.body);
          log("===================================================");
        }

        return Result.success(response);
      } catch (e) {
        log("Error in request ${request.url}: ${e.toString()}");

        return const Result.error(HBError(errorType: ErrorType.networkError));
      }
    } else {
      return const Result.error(HBError(errorType: ErrorType.networkError));
    }
  }

  Result<T, HBError> _handleResponse<T>(
    http.Response response,
    String errorMsg,
    T Function(Map<String, dynamic> response) mapper,
  ) {
    try {
      final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;

      switch (response.statusCode) {
        case 200:
        case 201:
        case 202:
          return Result.success(mapper(jsonMap));
        case 401:
          _notifyAutoLogout();
          return const Result.error(HBError(errorType: ErrorType.unauthorized));
        case 408:
          return const Result.error(HBError(errorType: ErrorType.timeoutError));
        case 500:
          return const Result.error(HBError(errorType: ErrorType.serverError));
        default:
          return const Result.error(HBError(errorType: ErrorType.unknown));
      }
    } catch (e) {
      log("Error on request ${e.toString()}");

      return const Result.error(HBError(errorType: ErrorType.parseError));
    }
  }

  onTimeoutError() {
    return http.Response(
      "{\"message\":\"Something went wrong, please try again later\"}",
      408,
    );
  }

  onError() {
    return http.Response(
      "{\"message\":\"Something went wrong, please try again later\"}",
      500,
    );
  }

  _notifyAutoLogout() {
    NotificationCenter().notify('force_auto_logout', data: {'value': true});
  }
}
