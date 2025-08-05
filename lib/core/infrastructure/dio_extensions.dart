import 'dart:io';

import 'package:dio/dio.dart';

extension DioExceptionX on DioException {
  bool get isNoConnectionException => error is SocketException;
}
