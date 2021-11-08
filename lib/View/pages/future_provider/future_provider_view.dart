import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_sample/presenters/pages/future_provider/future_provider_notifier.dart';

// StateProviderを利用する場合
// 画面呼び出し時にFutureProviderの処理が始まる

class Downloading extends ConsumerWidget {
  Downloading({Key? key, required this.title}) : super(key: key);
  final String title;

  // 画面更新の監視用フラグ(true:赤 false:黃)
  bool _flg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 再描画ごとにフラグを反転
    _flg = !_flg;

    // 状態の監視が必要な場合はwatch()で呼び出し
    final provider = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        color: _flg ? Colors.red : Colors.yellow,
        child: Center(
          child: Text(
            provider.when(
              // 非同期処理中はloadingと表示される
              loading: (previous) {
                return "loading";
              },
              // エラーが発生した場合はerrorと表示される
              error: (error, stackTrace, previous) {
                return "error";
              },
              // 非同期処理が完了するとdataで取得した状態が使用できる
              // 非同期処理終了時に画面の再描画が入る
              data: (data) {
                return data;
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 状態の再読み込み
          ref.refresh(futureProvider);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

