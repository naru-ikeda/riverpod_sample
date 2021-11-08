import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProviderを利用する場合

// int型のStateProviderの宣言
// 別名で定義すれば同じ型のProviderでも使える
final counterProvider1 = StateProvider<int>((ref) => 0);

final counterProvider2 = StateProvider<int>((ref) => 10);

final counterProvider3 = StateProvider<int>((ref) => 0);

