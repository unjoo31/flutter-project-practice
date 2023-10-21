import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response.dart';
import 'package:logger/logger.dart';

void main() async {
  await fetch();
}

Future<void> fetch() async {
  Response<dynamic> response = await dio.get("/books");

  Logger().d(response);
  Logger().d(response.data);

  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  Logger().d("fetchBookList : ${responseDTO.code}");
}
