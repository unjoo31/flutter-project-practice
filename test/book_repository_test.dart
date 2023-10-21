import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:logger/logger.dart';

void main() async {
  await fetch();
}

Future<void> fetch() async {
  Response<dynamic> response = await dio.get("/books/1");
  Logger().d(response);
}
