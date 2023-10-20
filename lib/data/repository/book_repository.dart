import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response.dart';
import 'package:flutter_blog/data/model/Book.dart';
import 'package:logger/logger.dart';

class BookRepository {
  Future<ResponseDTO> fetchBookList() async {
    try {
      final response = await dio.get("/books");

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      Logger().d(responseDTO.data);
      List<dynamic> mapList = responseDTO.data as List<dynamic>;
      List<Book> bookList = mapList.map((e) => Book.fromJson(e)).toList();

      responseDTO.data = bookList;
      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "책 목록 불러오기 실패", null);
    }
  }
}
