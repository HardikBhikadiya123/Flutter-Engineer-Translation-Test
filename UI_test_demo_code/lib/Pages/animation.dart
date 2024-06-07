
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationInfo {
  AnimationInfo({
    required this.effectsBuilder,
    required this.controller,
  });

  final List<Effect> Function() effectsBuilder;
  final AnimationController controller;
  List<Effect>? _effects; // Get effects or create them using the builder
  List<Effect> get effects =>
      _effects ??= effectsBuilder(); // Update effects if new ones are provided
  void maybeUpdateEffects(List<Effect>? updatedEffects) {
    if (updatedEffects != null) {
      _effects = updatedEffects;
    }
  }
} // Extension to add animation capabilities to any

extension AnimatedWidgetExtension on Widget {
  Widget animateOnPageLoad(
      AnimationInfo animationInfo, {
        List<Effect>? effects,
      }) {
    // Update effects if new ones are provided
    animationInfo.maybeUpdateEffects(effects);

    return Animate(
      effects: animationInfo.effects,
      child: this,
    );
  }
}
