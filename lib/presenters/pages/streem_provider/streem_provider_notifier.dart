// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// // FutureProviderを利用する場合
//
// // 使い方的にはFutureProviderに近い
// // Streamでは、断続的に値が更新される
// // Firebaseは利用できないためコメントアウト
// final streamProvider = StreamProvider<String>((ref) {
//   // Firebase Cloud Firestoreで取得できるsnapshotなどのStreamを利用する場合
//   // users/{user.uid} ドキュメントのSnapshotを取得
//   final collection = FirebaseFirestore.instance.collection('items');
//
//   // データ（Map型）を取得
//   final stream = collection.snapshots().map(
//     // CollectionのデータからItemクラスを生成する
//     (e) => e.docs.map((e) => Item.fromJson(e.data())).toList(),
//   );
//
//   return stream;
// });
