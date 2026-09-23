import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';
import '../widgets/glass_card.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  final PortfolioController controller;

  const AboutSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      key: controller.aboutKey,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: isMobile ? 32 : 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const SectionHeader(
                badge: "Professional Summary",
                title: "Architecting Scalable Mobile Ecosystems",
                subtitle:
                    "Passionate about clean architecture, responsive animations, and rock-solid state management.",
              ),
              const SizedBox(height: 28),
              GlassCard(
                padding: EdgeInsets.all(isMobile ? 20 : 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      PortfolioData.summary,
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 14 : 15.5,
                        color: const Color(0xFFCBD5E1),
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Key Domain Verticals Shipped:",
                      style: GoogleFonts.inter(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF00D2FF),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _domainChip("🕉️ Spiritual Tech & Video Calls"),
                        _domainChip("🏢 Enterprise HRMS & Geofencing"),
                        _domainChip("🏡 Real Estate & Map Discovery"),
                        _domainChip("🛍️ Retail E-Commerce"),
                        _domainChip("🎨 CustomPainter Graphic Tools"),
                        _domainChip("🌍 International Recruitment"),
                        _domainChip("📰 Media & Dynamic Streaming"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _domainChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12.5,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
