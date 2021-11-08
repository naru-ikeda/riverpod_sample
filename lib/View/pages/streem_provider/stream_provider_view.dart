// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import 'package:riverpod_sample/presenters/pages/streem_provider/streem_provider_notifier.dart';
//
// // StreamProviderを利用する場合
// // 利用例が作れないのでコメントアウト
//
// class Streamer extends ConsumerWidget {
//   const Streamer({Key? key, required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // StreamProviderを取得
//     final items = ref.watch(streamProvider);
//
//     return Scaffold(
//       // FutureProviderクラスと同じように.whenを使ってハンドリングする
//       body: item.when(
//         // 処理中はCircularProgressIndicatorが表示される
//         loading: (previous) => const CircularProgressIndicator(),
//         // エラーが発生した場合に表示されるWidgetを指定
//         error: (error, stackTrace, previous) => Text('Error: $error'),
//         // 取得した状態がdataで使用できる
//         data: (data) {
//           return ListView.builder(
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               final item = items[index];
//               return ListTile(title: Text(item.name));
//             },
//           );
//         },
//       ),
//     ),
//     );
//   }