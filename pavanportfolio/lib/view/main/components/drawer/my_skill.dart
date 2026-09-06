import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../res/constants.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    super.key,
    required this.percentage,
    required this.title,
    this.image,
  });

  final double percentage;
  final String title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    final percentStyle = GoogleFonts.montserrat(
      color: Colors.white70,
      fontSize: 12,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding * 0.75),
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: percentage),
        duration: const Duration(seconds: 1),
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (image != null)
                    Image.asset(
                      image!,
                      height: 18,
                      width: 18,
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(width: 8),
                  Text(title, style: titleStyle),
                  const Spacer(),
                  Text('${(value * 100).toInt()}%', style: percentStyle),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 8,
                  backgroundColor: Colors.white10,
                  color: Colors.amberAccent,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AnimatedLinearProgressIndicator(
            percentage: 0.7,
            title: 'Flutter',
            image: 'assets/icons/flutter.png',
          ),
          AnimatedLinearProgressIndicator(
            percentage: 0.9,
            title: 'Dart',
            image: 'assets/icons/dart.png',
          ),
          AnimatedLinearProgressIndicator(
            percentage: 0.6,
            title: 'Firebase',
            image: 'assets/icons/firebase.png',
          ),
          AnimatedLinearProgressIndicator(
            percentage: 0.85,
            title: 'Sqlite',
            image: 'assets/icons/dart.png',
          ),
          AnimatedLinearProgressIndicator(
            percentage: 0.8,
            title: 'Responsive Design',
            image: 'assets/icons/flutter.png',
          ),
          AnimatedLinearProgressIndicator(
            percentage: 0.9,
            title: 'Clean Architecture',
            image: 'assets/icons/flutter.png',
          ),
          AnimatedLinearProgressIndicator(
            percentage: 0.5,
            title: 'Bloc',
            image: 'assets/icons/bloc.png',
          ),
          AnimatedLinearProgressIndicator(
            percentage: 0.93,
            title: 'Getx',
            image: 'assets/icons/dart.png',
          ),
          AnimatedLinearProgressIndicator(
            percentage: 0.95,
            title: 'Mvc',
            image: 'assets/icons/dart.png',
          ),
        ],
      ),
    );
  }
}
