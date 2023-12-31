import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/book_list_page/widgets/book_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'widgets/book_grid_view.dart';

class BookListPage extends ConsumerWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  BookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text("한 달 이내에 출간된 책"),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          Logger().d("리스래시됨");
          ref.read(bookListProvider.notifier).notifyInit();
        },
        child: BookGridView(),
      ),
    );
  }
}
