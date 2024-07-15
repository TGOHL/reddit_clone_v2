// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';

class StretchedContainer extends StatefulWidget {
  final StretchedController controller;
  final Widget child;
  final Widget? fillChild;
  final Function(StretchedController controller)? onDrag;
  final Function(StretchedController controller)? onAdjust;

  const StretchedContainer({
    super.key,
    required this.controller,
    required this.child,
    this.onDrag,
    this.onAdjust,
    this.fillChild,
  });

  @override
  State<StretchedContainer> createState() => _StretchedContainerState();
}

class _StretchedContainerState extends State<StretchedContainer> {
  double height = 0.0;
  bool isFullScreen = true;

  @override
  void initState() {
    super.initState();

    height = widget.controller.startMinimized ? widget.controller.minimum : widget.controller.maximum;
    widget.controller.onAnimate.stream.listen((val) {
      setState(() {
        height = val;
        widget.onAdjust?.call(widget.controller);
      });
    });
    widget.controller._height = height;
  }

  void _resize(double delta) {
    if (height == widget.controller.minimum && delta.isNegative) {
      return;
    } else if (height < widget.controller.minimum && delta.isNegative) {
      setState(() {
        height = widget.controller.minimum;
      });
    } else if (height == widget.controller.maximum && !delta.isNegative) {
      return;
    } else if (height > widget.controller.maximum && !delta.isNegative) {
      setState(() {
        height = widget.controller.maximum;
      });
    } else {
      setState(() {
        height += delta;
        if (height > widget.controller.maximum) {
          height = widget.controller.maximum;
        } else if (height < widget.controller.minimum) {
          height = widget.controller.minimum;
        }
      });
    }

    widget.controller._height = height;
    widget.onDrag?.call(widget.controller);
  }

  void _adjustScreen(DragEndDetails details) {
    if (isFullScreen) {
      // Try Shrinking
      if (widget.controller.ratioReversed >= 0.3) {
        // Enough Distance (Shrink)
        setState(() {
          height = widget.controller.minimum;
          isFullScreen = false;
        });
      } else {
        // NOT Enough Distance (Stretching Back)
        setState(() {
          height = widget.controller.maximum;
          isFullScreen = true;
        });
      }
    } else if (!isFullScreen) {
      // Try Stretching
      if (widget.controller.ratio >= 0.3) {
        // Enough Distance (Stretch)
        setState(() {
          height = widget.controller.maximum;
          isFullScreen = true;
        });
      } else {
        // NOT Enough Distance (Shrink Back)
        setState(() {
          height = widget.controller.minimum;
          isFullScreen = false;
        });
      }
    }
    widget.controller._height = height;
    widget.controller._isFullScreen = isFullScreen;
    widget.onAdjust?.call(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.controller.maximum,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          _resize(details.primaryDelta!);
        },
        onVerticalDragEnd: (details) {
          _adjustScreen(details);
        },
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration.zero,
              height: height,
              child: widget.child,
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: widget.fillChild,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StretchedController {
  final double minimum;
  final double maximum;
  final bool startMinimized;
  final Function(double newHeight)? onHeightChanged;
  final StreamController<double> onAnimate = StreamController<double>();
  late AnimationController _controller;
  double _height = 0.0;
  bool _isFullScreen = true;

  double get height => _height;
  bool get isFullScreen => _isFullScreen && ratio == 1;

  StretchedController({
    required this.minimum,
    required this.maximum,
    this.startMinimized = false,
    this.onHeightChanged,
  });

  /// this is (ZERO) when fully minimized and (ONE) when fully extended
  double get ratio {
    double result = (height - minimum) / (maximum - minimum);
    if (result > 1.0) {
      result = 1.0;
    } else if (result < 0.0) {
      result = 0.0;
    }
    return result;
  }

  /// this is (ONE) when fully minimized and (ZERO) when fully extended
  double get ratioReversed => 1.0 - ratio;

  void setAnimationController(TickerProvider context) {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: context,
    );
  }

  void animateOpen(TickerProvider context) async {
    _controller.reset();

    Animation<double> animation = Tween<double>(begin: maximum, end: minimum).animate(_controller);
    animation.addListener(() {
      _height = animation.value;
      onAnimate.add(animation.value);
    });
    _controller.forward().then((value) {
      _height = minimum;
      _isFullScreen = false;
      onAnimate.add(_height);
    });

    // while (_height > minimum) {
    //   _height -= 1;
    //   onAnimate.add(_height);
    //   await Future.delayed(const Duration(microseconds: 10));
    // }
    // _height = minimum;
    // _isFullScreen = false;
    // onAnimate.add(_height);
  }
}
