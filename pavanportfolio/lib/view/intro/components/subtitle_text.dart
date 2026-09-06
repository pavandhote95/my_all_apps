import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavanportfolio/res/constants.dart';

class AnimatedSubtitleText extends StatefulWidget {
  final double start;
  final double end;
  const AnimatedSubtitleText({
    super.key,
    required this.start,
    required this.end,
  });

  @override
  State<AnimatedSubtitleText> createState() => _AnimatedSubtitleTextState();
}

class _AnimatedSubtitleTextState extends State<AnimatedSubtitleText> {
  final List<String> phrases = [
    'Software Developer',
    'Web Developer',
    'App Developer',
  ];

  String currentText = '';
  int phraseIndex = 0;
  int charIndex = 0;
  Timer? _typingTimer;
  Timer? _switchTimer;
  Timer? _cursorTimer;
  bool showCursor = true;

  @override
  void initState() {
    super.initState();
    _startTyping();
    _startCursorBlink();
  }

  void _startTyping() {
    _typingTimer?.cancel();
    _switchTimer?.cancel();
    currentText = '';
    charIndex = 0;

    _typingTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (charIndex < phrases[phraseIndex].length) {
        setState(() {
          currentText += phrases[phraseIndex][charIndex];
          charIndex++;
        });
      } else {
        timer.cancel();
        _switchTimer = Timer(const Duration(seconds: 2), () {
          setState(() {
            phraseIndex = (phraseIndex + 1) % phrases.length;
          });
          _startTyping();
        });
      }
    });
  }

  void _startCursorBlink() {
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {
          showCursor = !showCursor;
        });
      }
    });
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    _switchTimer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: widget.start, end: widget.end),
      duration: const Duration(milliseconds: 1000),
      builder: (context, value, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Static "I am a" text in white
            Text(
              'I am a ',
              style: GoogleFonts.montserrat(
                fontSize: value,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            // Animated text with cursor in green
            Text(
              '$currentText${showCursor ? "|" : ""}',
              style: GoogleFonts.montserrat(
                fontSize: value,
                fontWeight: FontWeight.w900,
                color: Colors.redAccent,
              ),
            ),
          ],
        );
      },
    );
  }
}