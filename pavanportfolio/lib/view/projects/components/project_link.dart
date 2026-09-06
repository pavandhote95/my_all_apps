import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/project_model.dart';

class ProjectLinks extends StatelessWidget {
  final int index;
  const ProjectLinks({super.key, required this.index});

  Future<void> openPayment() async {
    final Uri upiUri = Uri.parse(
      'upi://pay?pa=7415743916-4@ybl&pn=Pavan%20Dhote&am=200&cu=INR&tn=Code%20Payment',
    );

    await launchUrl(
      upiUri,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return
   Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.green.withOpacity(0.4),
          ),
        ),
        child: Row(
          children: [
            const Text("For"),
            const SizedBox(width: 6),
            Text(
              'code',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
             const Icon(Icons.arrow_right_alt_rounded,color: Colors.white,)
          ],
        ),
      ),
    ),

    const SizedBox(width: 10),

    Expanded(
      child: ElevatedButton.icon(
        onPressed: openPayment,
        icon: const Icon(Icons.payment, size: 18),
        label: const Text('Pay Now'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  ],
);
 
  }
}