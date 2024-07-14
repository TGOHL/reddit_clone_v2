import 'package:flutter/material.dart';
import 'package:reddit_clone/shared/config/assets.dart';
import 'package:reddit_clone/shared/enums/arrow.dart';

class ArrowButton extends StatefulWidget {
  final ArrowButtonDirection direction;
  final bool selected;
  final int size;
  final EdgeInsets? padding;
  final Function() onPressed;

  const ArrowButton({
    super.key,
    required this.direction,
    required this.selected,
    required this.onPressed,
    this.size = 24,
    this.padding,
  });

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool selected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    double tweenValue = widget.direction == ArrowButtonDirection.UP ? -10 : 10;
    _animation = TweenSequence(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: tweenValue),
          weight: 1,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: tweenValue, end: 0),
          weight: 1,
        ),
      ],
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(ArrowButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    selected = widget.selected;
  }

  String get arrowAsset {
    String asset = '';
    if (widget.direction == ArrowButtonDirection.UP) {
      asset = selected ? AppAssets.ASSET_ARROW_UP_SOLID : AppAssets.ASSET_ARROW_UP_OUTLINE;
    } else {
      asset = selected ? AppAssets.ASSET_ARROW_DOWN_SOLID : AppAssets.ASSET_ARROW_DOWN_OUTLINE;
    }
    return asset;
  }

  Color get assetColor {
    Color color;
    if (!selected) {
      color = Colors.white;
    } else if (widget.direction == ArrowButtonDirection.UP) {
      color = Colors.red;
    } else {
      color = Colors.purple;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          _controller.forward(from: 0);

          widget.onPressed();
          setState(() {});
        },
        child: Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: Image.asset(
            arrowAsset,
            color: assetColor,
            width: widget.size.toDouble(),
            height: widget.size.toDouble(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
