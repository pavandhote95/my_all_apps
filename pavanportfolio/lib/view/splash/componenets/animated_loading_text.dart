import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:pavanportfolio/res/constants.dart';

class AnimatedLoadingText extends StatefulWidget {
  const AnimatedLoadingText({super.key});

  @override
  State<AnimatedLoadingText> createState() => _AnimatedLoadingTextState();
}

class _AnimatedLoadingTextState extends State<AnimatedLoadingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (kIsWeb) {
      // Web: Start immediately
      _controller.forward();
    } else {
      // App: Add delay before starting to prevent skip
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 200), () {
          if (mounted) _controller.forward();
        });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: defaultPadding * 5,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final value = _animation.value;
          final percent = (value * 100).toInt();
          return Column(
            children: [
              LinearProgressIndicator(
                backgroundColor: Colors.black,
                color: buttonColor,
                value: value,
              ),
              const SizedBox(height: defaultPadding / 2),
              Text(
                '$percent%',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(color: Colors.pink, blurRadius: 10, offset: Offset(2, 2)),
                    Shadow(color: Colors.blue, blurRadius: 10, offset: Offset(-2, -2)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
