import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providerを利用する場合

// 定数
final piProvider = Provider<double>((ref) => 3.14);

// 別のProviderの値を10倍するフィルター
// ref.watch(Provider名)とすることで別のプロバイダーを参照できます
final times10Provider = Provider((ref) => ref.watch(piProvider) * 10);
