import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_sample/presenters/pages/state_notifier_provider/state_notifier_provider_notifier.dart';

// StateNotifierProviderを利用する場合

class CountMinus extends ConsumerWidget {
  CountMinus({Key? key, required this.title}) : super(key: key);
  final String title;

  // 画面更新の監視用フラグ(true:赤 false:黃)
  bool _flg = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 再描画ごとにフラグを反転
    _flg = !_flg;

    // Providerを監視してDialog表示などの処理を実行したい場合、以下のように実装する
    // Provider更新時はlisten内の処理のみ実行されるので、他の処理は実行されない
    ref.listen<int>(
      counterProviderA,
      (count) {
        // countが5の倍数になったときにDialogを表示
        if (count % 5 == 0) {
          showDialog(
            context: context,
            builder: (_) {
              return _Dialog();
            },
          );
        }
      },
    );

    // 状態の監視が必要な場合はwatch()で呼び出し
    // .stateは不要
    final count = ref.watch(counterProviderA);

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        color: this._flg ? Colors.red : Colors.yellow,
        child: Center(
          child: Text('count is $count'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 状態の監視が不要な場合はread()で呼び出し
          // 関数を呼び出して状態を操作する
          // ref.read(Provider名.notifier).関数名()で呼び出せる
          ref.read(counterProviderA.notifier).countDown();
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.remove,
        ),
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      children: <Widget>[
        Center(
          // StatelessWidget内でも利用可能
          child: Consumer(
            builder: (context, ref, child) {
              final count = ref.read(counterProviderA);
              return Text('$count is Multiple of 5');
            },
          ),
        ),
      ],
    );
  }
}
