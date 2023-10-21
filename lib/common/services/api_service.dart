import 'dart:async';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

enum Method { get, delete, post, put, patch }

class ApiService {
  const ApiService.instance();

  static const _ = ApiService.instance();

  factory ApiService() => _;

  Future<String> request(String requestPath,
      {Method method = Method.get,
      Map<String, List<String>> queryParametersAll = const {},
      Map<String, String> headers = const {},
      Map<String, Object?> body = const {}}) async {
    final params = _queryToString(queryParametersAll);

    final uri = Uri.parse("$requestPath$params");

    try {
      Response response = await switch (method) {
        Method.get => get(uri, headers: headers),
        Method.patch => patch(uri, headers: headers, body: body),
        Method.post => post(uri, headers: headers, body: body),
        Method.delete => delete(uri, headers: headers, body: body),
        Method.put => put(uri, headers: headers, body: body),
      }
          .timeout(const Duration(minutes: 10));
      return switch (response.statusCode) {
        < 200 => throw Error.throwWithStackTrace(
            "${response.reasonPhrase}", StackTrace.current),
        >= 200 && < 300 => response.body,
        >= 399 && < 500 =>
          throw Error.throwWithStackTrace("Client Errow", StackTrace.current),
        >= 500 =>
          throw Error.throwWithStackTrace("Server Error", StackTrace.current),
        _ => throw Error.throwWithStackTrace(
            "Unexpected Errow", StackTrace.current),
      };
    } on TimeoutException catch (e, s) {
      debugPrint("$e\n$s");
      return throw Error.throwWithStackTrace(
        "Check your network connection!",
        StackTrace.current,
      );
    } catch (e, s) {
      debugPrint("$e\n$s");
      rethrow;
    }
  }

  String _queryToString(Map<String, List<String>> query) => query.entries
      .map((e) => e.value.map((v) => "${e.key}:$v").toList())
      .map((e) => e.join("&"))
      .join("&");
}
