// 창고 데이터
import 'package:flutter_blog/data/dto/response.dart';
import 'package:flutter_blog/data/model/Book.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class BookDetailModel {
  Book book;
  BookDetailModel(this.book);
}

// 창고
class BookDetailViewModel extends StateNotifier<BookDetailModel?> {
  BookDetailViewModel(super._state, this.ref);
  Ref ref;

  Future<void> notifyInit(int id) async {
    Logger().d("notifyInit");
    ResponseDTO responseDTO = await BookRepository().fetchBookDetail(id);
    Logger().d(responseDTO.data);
    state = BookDetailModel(responseDTO.data);
  }
}

// 창고 관리자
final bookDetailProvider =
    StateNotifierProvider.autoDispose<BookDetailViewModel, BookDetailModel?>(
        (ref) {
  int bookId = ref.read(paramProvider).bookDetailId ?? 1;
  return BookDetailViewModel(null, ref)..notifyInit(bookId);
});
