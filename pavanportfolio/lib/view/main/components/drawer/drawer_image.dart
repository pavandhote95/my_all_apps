import 'package:flutter/material.dart';

import '../../../../res/constants.dart';

class DrawerImage extends StatelessWidget {
  const DrawerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(defaultPadding/6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
      BoxShadow(
      color:         buttonColor.withOpacity(0.5),
      offset: const Offset(-2, 0),

    ),
    BoxShadow(
    color:         buttonColor.withOpacity(0.5),

    ),]
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Transform.rotate(
              angle: 0.0,
              child: Image.asset('assets/images/profile.png',fit: BoxFit.cover,))),
    );
  }
}
