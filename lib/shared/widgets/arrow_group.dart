import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/shared/config/themes.dart';
import 'package:reddit_clone/shared/enums/arrow.dart';
import 'arrow_button.dart';

class ArrowGroup extends StatefulWidget {
  final ArrowGoupAxis axis;
  final int likesCount;
  final ArrowButtonSelected? selectedValue;
  final Function(int delta) onChange;
  final bool hasBorders;
  const ArrowGroup({
    super.key,
    this.selectedValue,
    required this.axis,
    required this.onChange,
    required this.likesCount,
    this.hasBorders = false,
  });

  @override
  State<ArrowGroup> createState() => _ArrowGroupState();
}

class _ArrowGroupState extends State<ArrowGroup> {
  int count = 0;
  @override
  void initState() {
    count = widget.likesCount;
    selectedValue = widget.selectedValue;
    super.initState();
  }

  Color get assetColor {
    Color color;
    if (selectedValue == null) {
      color = Colors.white;
    } else if (selectedValue == ArrowButtonSelected.UP) {
      color = Colors.red;
    } else {
      color = Colors.purple;
    }
    return color;
  }

  Color get borderColor => AppThemes.lighGrey;

  ArrowButtonSelected? selectedValue;
  @override
  Widget build(BuildContext context) {
    if (widget.axis == ArrowGoupAxis.VERTICAL) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ArrowButton(
            direction: ArrowButtonDirection.UP,
            selected: selectedValue == ArrowButtonSelected.UP,
            onPressed: () {
              int delta = 0;
              setState(() {
                if (selectedValue == ArrowButtonSelected.UP) {
                  selectedValue = null;
                  delta = -1;
                } else if (selectedValue == ArrowButtonSelected.DOWN) {
                  selectedValue = ArrowButtonSelected.UP;
                  delta = 2;
                } else {
                  selectedValue = ArrowButtonSelected.UP;
                  delta = 1;
                }
              });
              count += delta;
              widget.onChange(delta);
            },
          ),
          Container(
            width: 24,
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '$count',
                style: TextStyle(color: assetColor),
              ),
            ),
          ),
          ArrowButton(
            direction: ArrowButtonDirection.DOWN,
            selected: selectedValue == ArrowButtonSelected.DOWN,
            onPressed: () {
              int delta = 0;
              setState(() {
                if (selectedValue == ArrowButtonSelected.DOWN) {
                  selectedValue = null;
                  delta = 1;
                } else if (selectedValue == ArrowButtonSelected.UP) {
                  selectedValue = ArrowButtonSelected.DOWN;
                  delta = -2;
                } else {
                  selectedValue = ArrowButtonSelected.DOWN;
                  delta = -1;
                }
                count += delta;
                widget.onChange(delta);
              });
            },
          ),
        ],
      );
    }
    return Container(
      decoration: widget.hasBorders ? BoxDecoration(border: Border.all(color: borderColor), borderRadius: BorderRadius.circular(30.w)) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ArrowButton(
            direction: ArrowButtonDirection.UP,
            selected: selectedValue == ArrowButtonSelected.UP,
            padding: widget.hasBorders ? EdgeInsets.symmetric(vertical: 6.w, horizontal: 8.w) : null,
            onPressed: () {
              int delta = 0;
              setState(() {
                if (selectedValue == ArrowButtonSelected.UP) {
                  selectedValue = null;
                  delta = -1;
                } else if (selectedValue == ArrowButtonSelected.DOWN) {
                  selectedValue = ArrowButtonSelected.UP;
                  delta = 2;
                } else {
                  selectedValue = ArrowButtonSelected.UP;
                  delta = 1;
                }
              });
              count += delta;
              widget.onChange(delta);
            },
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.only(
              left: selectedValue == ArrowButtonSelected.DOWN ? 8.w : 0.w,
              right: selectedValue != ArrowButtonSelected.DOWN ? 8.w : 0.w,
            ),
            decoration: BoxDecoration(
              border: !widget.hasBorders
                  ? null
                  : BorderDirectional(
                      start: selectedValue == ArrowButtonSelected.DOWN ? BorderSide(width: 1, color: borderColor) : BorderSide.none,
                      end: selectedValue != ArrowButtonSelected.DOWN ? BorderSide(width: 1, color: borderColor) : BorderSide.none,
                    ),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '$count',
                style: TextStyle(color: assetColor),
              ),
            ),
          ),
          ArrowButton(
            direction: ArrowButtonDirection.DOWN,
            selected: selectedValue == ArrowButtonSelected.DOWN,
            padding: widget.hasBorders ? EdgeInsets.symmetric(vertical: 6.w, horizontal: 8.w) : null,
            onPressed: () {
              int delta = 0;
              setState(() {
                if (selectedValue == ArrowButtonSelected.DOWN) {
                  selectedValue = null;
                  delta = 1;
                } else if (selectedValue == ArrowButtonSelected.UP) {
                  selectedValue = ArrowButtonSelected.DOWN;
                  delta = -2;
                } else {
                  selectedValue = ArrowButtonSelected.DOWN;
                  delta = -1;
                }
                count += delta;
                widget.onChange(delta);
              });
            },
          ),
        ],
      ),
    );
  }
}
