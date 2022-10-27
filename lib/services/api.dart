import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/services/response.dart';

abstract class Response {}

abstract class SuccessfulResponse extends Response {}

abstract class ErrorResponse extends Response {}

abstract class Api {
  Future<Response> get({
    required Uri uri,
    required Response Function(String body) mapper,
    Map<String, String>? headers,
  }) {
    uri = uri;

    return http.get(uri, headers: headers).then(
          (response) => _handleResponse(response, mapper),
          onError: _handleOnError,
        );
  }

  ErrorResponse _handleOnError(e) {
    print(e);
    if (e is SocketException) {
      return NoInternetResponse();
    } else if (e is TimeoutException) {
      return TimeoutResponse();
    }
    return GeneralErrorResponse();
  }

  Uri _prepareUri(Uri uri) {
    final newQueryParameters = Map<String, dynamic>.from(uri.queryParameters);
    uri = uri.replace(queryParameters: newQueryParameters);
    return uri;
  }

  Response _handleResponse(
      http.Response response, Response Function(String body) mapper) {
    switch (response.statusCode) {
      case 200:
        return mapper(response.body);
      case 400:
        return BadRequestResponse();
      case 401:
      case 403:
        return UnAuthorizedResponse();
      case 404:
        return NotFoundResponse();
      default:
        return NotHandledResponse();
    }
  }
}
