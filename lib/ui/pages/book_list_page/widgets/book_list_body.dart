import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/Book.dart';
import 'package:flutter_blog/ui/pages/book_list_page/widgets/book_form.dart';
import 'package:flutter_blog/ui/pages/book_list_page/widgets/book_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookListBody extends ConsumerWidget {
  const BookListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BookListModel? model = ref.watch(bookListProvider);
    List<Book> books = [];

    if (model != null) {
      books = model.books;
    }

    // 제한할 길이와 갯수
    final int maxLength = 150;
    final int maxItemCount = 10;

    // 길이 및 갯수 제한 후의 리스트
    List<Book> limitedBooks = books
        .where((book) => book.title.length <= maxLength)
        .take(maxItemCount)
        .toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return bookForm(limitedBooks[index]);
              },
              childCount: 9,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              mainAxisSpacing: 30,
              crossAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
