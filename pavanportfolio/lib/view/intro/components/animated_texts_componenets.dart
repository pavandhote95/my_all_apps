import 'package:flutter/material.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({
    Key? key,
    this.height = 320,
    this.width = 270,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<AnimatedImageContainer> createState() =>
      _AnimatedImageContainerState();
}

class _AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final floatY = 8 * _controller.value;

        return Transform.translate(
          offset: Offset(0, floatY),
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(defaultPadding / 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(221, 222, 220, 220),// ,redAccent
                  Color.fromARGB(220, 204, 202, 202)//, // deep red
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x55FF5252),
                  offset: Offset(-4, 4),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: Color(0x33212121),
                  offset: Offset(4, 6),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(28),
              ),
              padding: const EdgeInsets.all(defaultPadding / 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/images/image.jpg',
                  height: widget.height! - 20,
                  width: widget.width! - 20,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
