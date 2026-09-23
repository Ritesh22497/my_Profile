import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';

class FooterSection extends StatelessWidget {
  final PortfolioController controller;

  const FooterSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _footerIcon(
                  Icons.code_rounded,
                  () => controller.openGitHub(),
                  "GitHub",
                ),
                const SizedBox(width: 14),
                _footerIcon(
                  Icons.work_rounded,
                  () => controller.openLinkedIn(),
                  "LinkedIn",
                ),
                const SizedBox(width: 14),
                _footerIcon(
                  Icons.mail_outline_rounded,
                  () => controller.sendEmail(),
                  "Email",
                ),
                const SizedBox(width: 14),
                _footerIcon(
                  Icons.phone_rounded,
                  () => controller.callPrimaryPhone(),
                  "Call",
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              "© 2026 ${PortfolioData.name} • Senior Flutter Developer",
              style: GoogleFonts.inter(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF94A3B8),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Engineered with Flutter Web & Dart • MVC Architecture • 60 FPS Custom Animations",
              style: GoogleFonts.inter(
                fontSize: 12,
                color: const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _footerIcon(IconData icon, VoidCallback onTap, String tooltip) {
    return IconButton(
      icon: Icon(icon, size: 20, color: const Color(0xFF94A3B8)),
      onPressed: onTap,
      tooltip: tooltip,
      hoverColor: const Color(0xFF00D2FF).withValues(alpha: 0.15),
    );
  }
}
