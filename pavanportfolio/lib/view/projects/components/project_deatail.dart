import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavanportfolio/view/projects/components/project_link.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class ProjectDetail extends StatelessWidget {
  final int index;
  const ProjectDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    
Future<void> openPayment(int amount) async {
  final Uri upiUri =  Uri.parse(
  'upi://pay?pa=7415743916-4@ybl&am=1&cu=INR'
);
  


  await launchUrl(
    upiUri,
    mode: LaunchMode.externalApplication,
  );
}
    var size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            projectList[index].name,
            style: GoogleFonts.montserrat(
              fontSize: 18, // 🔹 Smaller headline
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Responsive.isMobile(context)
            ? const SizedBox(height: defaultPadding / 2)
            : const SizedBox(height: defaultPadding),

        Text(
          projectList[index].description,
          style: GoogleFonts.montserrat(
            color: Colors.grey,
            height: 1.5,
          ),
          maxLines: size.width > 700 && size.width < 750
              ? 3
              : size.width < 470
              ? 2
              : size.width > 600 && size.width < 700
              ? 6
              : size.width > 900 && size.width < 1060
              ? 6
              : 4,
          overflow: TextOverflow.ellipsis,
        ),
    const Spacer(),
     Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        // decoration: BoxDecoration(
        //   color: Colors.green.withOpacity(0.15),
        //   borderRadius: BorderRadius.circular(12),
        //   border: Border.all(
        //     color: Colors.green.withOpacity(0.4),
        //   ),
        // ),
        child: Row(
          children: [
          
            const SizedBox(width: 6),
            Text(
              'Code',
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
ElevatedButton.icon(
  onPressed: () {


showDialog(
  context: context,
  builder: (context) => Dialog(
    backgroundColor: const Color(0xFF1E1E1E),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Support My Work ❤️",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/images/upi_qr.png",
              height: 220,
              width: 220,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white24,
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "7415743916-4@ybl",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.green,
                  ),
                  onPressed: () async {
                    await Clipboard.setData(
                      const ClipboardData(
                        text: "7415743916-4@ybl",
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("UPI ID Copied"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.close),
              label: const Text("Close"),
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);

  },
  label: const Text('Pay ₹1000'),
   style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),
 
 
  ],
),
 

      
        const SizedBox(height: defaultPadding / 2),
      ],
    );
  }
}
