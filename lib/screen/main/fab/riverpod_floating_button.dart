import 'package:fast_app_base/screen/main/fab/w_floating_button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final floatingButtonProvider = NotifierProvider<FloatingNotifier, FloatingButtonSate>(FloatingNotifier.new);

class FloatingNotifier extends Notifier<FloatingButtonSate> {
  FloatingNotifier() : super();

  bool needToMakeButtonBigger = false;
  @override
  build() {
    return const FloatingButtonSate(false, false, false);
  }

  void toggleMenu() {
    final isExpanded = state.isExpanded;
    final isSmall = state.isSmall;
    final isHided = state.isHided ?? false;

    state = FloatingButtonSate(!isExpanded, needToMakeButtonBigger ? false : true, false);
    if (!isExpanded && !isSmall) {
      needToMakeButtonBigger = true;
    } else {
      needToMakeButtonBigger = false;
    }
  }

  void onScrollDown() {
    state = FloatingButtonSate(state.isExpanded, true, false);
  }

  void onScrollUp() {
    state = FloatingButtonSate(state.isExpanded, false, false);
  }

  void hideButton() {
    state = state.copyWith(isHided: true);
    // copywith 는 파라미터 하나값만 변경도 가능하네..
  }

  void showButton() {
    state = state.copyWith(isHided: false);
  }
}
