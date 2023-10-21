import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/Book.dart';
import 'package:flutter_blog/ui/pages/book_list_page/widgets/book_form.dart';

class BookGridView extends StatelessWidget {
  const BookGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookForm(books[index]);
      },
    );
  }
}
