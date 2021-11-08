import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifierProviderを利用する場合

// StateNotifierProviderの宣言
final counterProviderA = StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier(0));

// 別名で定義すれば同型のProviderでも定義できる
final counterProviderB = StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier(10));

// 状態を操作する関数が実装されているクラス
class CounterNotifier extends StateNotifier<int>{
  // コンストラクタ
  CounterNotifier(int value) : super(value);

  void counter(int value) {
    this.state = value;
  }

  void countUp(){
    state++;
  }

  void countDown(){
    state--;
  }
}
