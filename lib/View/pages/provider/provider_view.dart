import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_sample/presenters/pages/provider/provider_notifier.dart';

// Providerを利用する場合

// Providerを使う場合はConsumerWidgetを継承する
class PI extends ConsumerWidget {
  const PI({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 状態の監視が必要な場合はwatch()で呼び出し
    final pi = ref.watch(piProvider);
    final times10 = ref.watch(times10Provider);

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
          child: Column(
            children: [
              const Spacer(),
              Text('pi is $pi'),
              const Spacer(),
              Text('times10 is $times10'),
              const Spacer(),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 状態の監視が不要な場合はread()で呼び出し
          // 値の操作はできない
          // ref.watch(counterProvider)++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
