import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터
class RequestParam {
  int? bookDetailId;
  // int? commentId;

  RequestParam({this.bookDetailId});
}

// 2. 창고 (비즈니스 로직)
class ParamStore extends RequestParam {
  final mContext = navigatorKey.currentContext;
  void addPostDetailId(int bookId) {
    this.bookDetailId = bookId;
  }

  void reset() {
    bookDetailId = null;
  }
}

// 3. 창고 관리자
final paramProvider = Provider<ParamStore>((ref) {
  return ParamStore();
});
