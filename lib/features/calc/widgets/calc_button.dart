import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({
    super.key,
    required this.displaySentence,
    this.onPressed,
  });

  final String displaySentence;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 4.0),
      child: SizedBox(
        height: 60,
        width: 80,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(displaySentence),
        ),
      ),
    );
  }
}
