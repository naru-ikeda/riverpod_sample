import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_sample/presenters/core/root_notifier.dart';

import 'package:riverpod_sample/View/pages/future_provider/future_provider_view.dart';
import 'package:riverpod_sample/View/pages/state_notifier_provider/state_notifier_provider_view.dart';
import 'package:riverpod_sample/View/pages/state_provider/state_provider_view.dart';

import 'View/pages/provider/provider_view.dart';

class Root extends ConsumerWidget {
  final _pageController = PageController();

  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ボタンのインデックス(PageViewのchildrenのindexと紐づく)
    int index = 0;

    return Scaffold(
      body: PageView(
        controller: this._pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const PI(title: "pi"),
          CountPlus(title: "plus"),
          CountMinus(title: "minus"),
          Downloading(title: "downloading"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          _navigationItem(Icons.circle, ref.watch(navigateProvider).state == index++),
          _navigationItem(Icons.exposure_plus_1, ref.watch(navigateProvider).state == index++),
          _navigationItem(Icons.exposure_minus_1, ref.watch(navigateProvider).state == index++),
          _navigationItem(Icons.downloading, ref.watch(navigateProvider).state == index++),
        ],
        currentIndex: ref.read(navigateProvider).state,
        onTap: (int index) {
          ref.read(navigateProvider).state = index;
          this._pageController.jumpToPage(ref.read(navigateProvider).state);
        },
      ),
    );
  }

  BottomNavigationBarItem _navigationItem(IconData icon, bool isSelected) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.grey,
        size: 20,
      ),
      label: '',
    );
  }
}
