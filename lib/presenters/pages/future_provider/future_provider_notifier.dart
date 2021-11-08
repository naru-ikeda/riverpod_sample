import 'package:flutter_riverpod/flutter_riverpod.dart';

// FutureProviderを利用する場合

// FutureProviderの宣言
final futureProvider = FutureProvider<String>((ref) async {
  // 重たい処理
  await Future.delayed(const Duration(seconds: 3));

  // 非同期処理内でエラーが発生した場合
  // throw Exception("err");

  // 取得した状態を返す
  return "complete";
});
