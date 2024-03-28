import 'package:freezed_annotation/freezed_annotation.dart';

part 'w_floating_button_state.freezed.dart';

@freezed
class FloatingButtonSate with _$FloatingButtonSate {
  const factory FloatingButtonSate(final bool isExpanded, final bool isSmall, final bool isHided) = _FloatingButtonSate;
}
