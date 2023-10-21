import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/Book.dart';

class BookForm extends StatelessWidget {
  final Book book;

  const BookForm(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset('${book.picUrl}', height: 150),
          SizedBox(height: 10),
          Text('${book.title}'),
          SizedBox(height: 10),
          Text('${book.writer}'),
        ],
      ),
    );
  }
}
