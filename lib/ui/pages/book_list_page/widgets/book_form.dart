import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/Book.dart';

class bookForm extends StatelessWidget {
  final Book book;
  const bookForm(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/${book.bookImage}'),
        Text(
          '${book.title}',
          style: TextStyle(
            fontSize: 16, // Adjust the font size as needed
            fontWeight: FontWeight.bold, // You can change the font weight
            color: Colors.black, // You can set the text color
          ),
        ),
        Text(
          '${book.author}',
          style: TextStyle(
            fontSize: 13, // Adjust the font size as needed
            fontWeight: FontWeight.bold, // You can change the font weight
            color: Colors.grey, // You can set the text color
          ),
        ),
      ],
    );
  }
}
