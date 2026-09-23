import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';
import '../widgets/responsive_layout.dart';

class HeroSection extends StatelessWidget {
  final PortfolioController controller;

  const HeroSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Container(
      key: controller.heroKey,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: isMobile ? 32 : 56,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: (isMobile || isTablet)
              ? Column(
                  children: [
                    _buildContent(context, isMobile: true),
                    const SizedBox(height: 36),
                    _buildVisualCard(context, isMobile: true),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: _buildContent(context, isMobile: false)),
                    const SizedBox(width: 48),
                    Expanded(flex: 4, child: _buildVisualCard(context, isMobile: false)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Status Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xFF10B981).withValues(alpha: 0.35),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Available for Senior Roles & High-Impact Apps",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF34D399),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // Main Name
        Text(
          "Hi, I'm ${PortfolioData.name}",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 32 : 50,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 10),

        // Subtitle Gradient
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF00D2FF), Color(0xFF3A7BD5), Color(0xFF8B5CF6)],
          ).createShader(bounds),
          child: Text(
            "🚀 ${PortfolioData.title} • 3+ Years Experience",
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.inter(
              fontSize: isMobile ? 16 : 21,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Bio
        Text(
          "Building robust, production-ready cross-platform mobile apps for Android & iOS. "
          "Proven track record of delivering 10+ production applications across spiritual services, "
          "enterprise HRMS, real estate, e-commerce, and creative branding tools.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14 : 15.5,
            color: const Color(0xFF94A3B8),
            height: 1.7,
          ),
        ),
        const SizedBox(height: 26),

        // Buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () => controller.scrollTo(controller.projectsKey),
              icon: const Icon(Icons.arrow_downward_rounded, size: 18),
              label: const Text("View 10+ Apps"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00D2FF),
                foregroundColor: const Color(0xFF050B14),
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 6,
                textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => controller.openWhatsApp(),
              icon: const Text("💬", style: TextStyle(fontSize: 16)),
              label: const Text("WhatsApp Chat"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF25D366), width: 1.4),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => controller.scrollTo(controller.contactKey),
              icon: const Icon(Icons.mail_outline_rounded, size: 18),
              label: const Text("Contact Me"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Stats Counters
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.start,
          children: [
            _statItem("3+", "Years Exp"),
            if (!isMobile) const SizedBox(width: 32),
            _statItem("10+", "Production Apps"),
            if (!isMobile) const SizedBox(width: 32),
            _statItem("500+", "Canvas Templates"),
            if (!isMobile) const SizedBox(width: 32),
            _statItem("30%", "Perf Boost"),
          ],
        ),
      ],
    );
  }

  Widget _statItem(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF00D2FF), Color(0xFF7928CA)],
          ).createShader(bounds),
          child: Text(
            number,
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildVisualCard(BuildContext context, {required bool isMobile}) {
    return Center(
      child: Container(
        width: isMobile ? 300 : 330,
        height: isMobile ? 350 : 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0x6600D2FF),
              Color(0x667928CA),
              Colors.transparent,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00D2FF).withValues(alpha: 0.22),
              blurRadius: 36,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0x3300D2FF), Color(0x337928CA)],
                  ),
                  border: Border.all(color: const Color(0xFF00D2FF), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00D2FF).withValues(alpha: 0.35),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text("👨‍💻", style: TextStyle(fontSize: 44)),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                PortfolioData.name,
                style: GoogleFonts.inter(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                PortfolioData.location,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: const Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                alignment: WrapAlignment.center,
                children: [
                  _miniBadge("Flutter"),
                  _miniBadge("Dart"),
                  _miniBadge("Riverpod"),
                  _miniBadge("Agora"),
                  _miniBadge("Razorpay"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _miniBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF00D2FF).withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF00D2FF).withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF00D2FF),
        ),
      ),
    );
  }
}
