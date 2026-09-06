import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback? onTap;
  const MenuButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 200),
          builder: (context, value, child) {
            return InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: defaultPadding * 2.0 * value,
                width: defaultPadding * 2.0 * value,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: buttonColor, // ✅ Solid redAccent color
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x55FF5252), // soft redAccent shadow
                      offset: Offset(2, 2),
                      blurRadius: 6,
                    ),
                    BoxShadow(
                      color: Color(0x33B71C1C), // deeper red
                      offset: Offset(-2, -2),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.redAccent,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.menu,
                      color: buttonTextColor, // ✅ white icon
                      size: defaultPadding * 1.2 * value,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const Spacer(flex: 5),
      ],
    );
  }
}
