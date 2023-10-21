import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/Book.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/pages/book_detail_page/book_detail_page.dart';
import 'package:flutter_blog/ui/pages/book_list_page/widgets/book_form.dart';
import 'package:flutter_blog/ui/pages/book_list_page/widgets/book_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class BookGridView extends ConsumerWidget {
  const BookGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BookListModel? model = ref.watch(bookListProvider);
    List<Book> books = [];

    if (model != null) {
      books = model.books;
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            ParamStore paramStore = ref.read(paramProvider);
            paramStore.bookDetailId = books[index].id;
            Logger().d("title : ${paramStore.bookDetailId}");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BookDetailPage(),
              ),
            );
          },
          child: BookForm(
            books[index],
          ),
        );
      },
    );
  }
}
