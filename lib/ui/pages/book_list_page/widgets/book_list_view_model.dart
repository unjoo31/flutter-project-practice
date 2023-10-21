import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../data/dto/response.dart';
import '../../../../data/model/Book.dart';
import '../../../../main.dart';

class BookListModel {
  List<Book> books;
  BookListModel(this.books);
}

class BookListViewModel extends StateNotifier<BookListModel?> {
  BookListViewModel(super._state, this.ref);
  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit() async {
    Logger().d("notifyInit");
    ResponseDTO responseDTO = await BookRepository().fetchBookList();
    state = BookListModel(responseDTO.data);
    Logger().d("notifyInit : ${responseDTO.data}");
  }
}

final bookListProvider =
    StateNotifierProvider.autoDispose<BookListViewModel, BookListModel?>((ref) {
  return BookListViewModel(null, ref)..notifyInit();
});
