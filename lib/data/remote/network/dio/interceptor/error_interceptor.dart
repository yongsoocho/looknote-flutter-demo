import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:looknote/data/remote/network/model/error/error_model.dart';
import 'package:looknote/main.dart';

abstract class ErrorInterceptor {
  ErrorInterceptor._();
  static void onError(DioError err, ErrorInterceptorHandler handler) async {
    var response = await jsonDecode(err.response.toString());
    final result = ErrorModel.fromJson(response);
    snackBarKey.currentState?.showSnackBar(
      errorSnackBar(result.data),
    );

    if (err.response?.statusCode == 401) {
     await navigatorKey.currentState?.pushNamedAndRemoveUntil(
          "/login", (Route<dynamic> route) => false);
    }

    handler.next(err);
  }
}
