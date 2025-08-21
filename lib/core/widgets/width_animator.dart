import 'dart:async';
import 'package:flutter/widgets.dart';

class WidthAnimator {
  final TickerProvider vsync;
  late void Function(double) onUpdate;
  Timer? _timer;
  double _currentWidth = 0;

  WidthAnimator({required this.vsync, required double initialWidth}) {
    _currentWidth = initialWidth;
  }

  void start(double targetWidth, {double step = 6.0, Duration frameDuration = const Duration(milliseconds: 1000)}) {
    _timer?.cancel();

    _timer = Timer.periodic(frameDuration, (timer) {
      if (_currentWidth >= targetWidth) {
        _currentWidth = targetWidth;
        onUpdate(_currentWidth);
        timer.cancel();
      } else {
        _currentWidth += step;
        onUpdate(_currentWidth);
      }
    });
  }

  void cancel() {
    _timer?.cancel();
  }

  double get currentWidth => _currentWidth;
}
