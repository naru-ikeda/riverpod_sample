import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_sample/presenters/pages/state_provider/state_provider_notifier.dart';

// StateProviderを利用する場合

class CountPlus extends ConsumerWidget {
  CountPlus({Key? key, required this.title}) : super(key: key);
  final String title;

  // 画面更新の監視用フラグ(true:赤 false:黃)
  bool _flg1 = true;
  bool _flg2 = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          children: [
            // 再描画はConsumerで囲んだ範囲ごとに行われる
            // counterProvider1_2が更新されてもこちらは更新されない
            Consumer(
              builder: (context, ref, child) {
                // 再描画ごとにフラグを反転
                _flg1 = !_flg1;

                // 状態の監視が必要な場合はwatch()で呼び出し
                // 値は.stateに入っている
                return _textAria(ref.watch(counterProvider1).state, _flg1);
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                // 再描画ごとにフラグを反転
                _flg2 = !_flg2;

                // 別名で定義されているので同じ型のProviderが更新されてもこちらは更新されない
                return _textAria(ref.watch(counterProvider2).state, _flg2);
              },
            ),
            // ConsumerWidgetを継承したクラスを呼ぶときはConsumerで囲む必要はない
            _Under(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _addButton(ref.read(counterProvider1)),
          _addButton(ref.read(counterProvider2)),
          _addButton(ref.read(counterProvider3)),
       ],
      ),
    );
  }

  Widget _textAria (int count, bool flg) {
    return Expanded(
      child: Container(
        // フラグに応じて背景色を設定
        color: flg ? Colors.red : Colors.yellow,
        child: Center(
          child: Text('count is $count'),
        ),
      ),
    );
  }

  FloatingActionButton _addButton(StateController ctr){
    return FloatingActionButton(
      onPressed: () {
        ctr.state++;
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class _Under extends ConsumerWidget {
  // 画面更新の監視用フラグ(true:赤 false:黃)
  bool _flg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _flg = !_flg;

    // select()を利用して、値が10を超えた場合のみ画面を更新
    final isAbove10 = ref.watch(counterProvider3.select((s) => s.state > 10));

    return Expanded(
      child: Container(
        color: _flg ? Colors.red : Colors.yellow,
        child: Center(
          child: Text('count3 > 10 $isAbove10'),
        ),
      ),
    );
  }
}