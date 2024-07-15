import 'package:flutter/material.dart';

class CustomTextStyler extends StatelessWidget {
  final String text;
  final TextStyle style;

  const CustomTextStyler(this.text, {super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = _getStyledText(text);

    return RichText(
      text: TextSpan(children: spans),
    );
  }

  List<TextSpan> _getStyledText(String text) {
    List<TextSpan> spans = [];
    final regex = RegExp(r'\s+');
    final words = text.split(regex);

    for (var word in words) {
      if (word.startsWith('r/')) {
        spans.add(
          TextSpan(
            text: '$word ',
            style: style.copyWith(color: Colors.blue),
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: '$word ',
            style: style,
          ),
        );
      }
    }
    return spans;
  }
}
