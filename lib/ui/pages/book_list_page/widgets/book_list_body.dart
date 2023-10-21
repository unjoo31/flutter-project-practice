import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/custom_tab_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookListBody extends ConsumerWidget {
  const BookListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTabBar();
  }
}
