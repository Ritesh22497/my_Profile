import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/portfolio_controller.dart';
import '../widgets/responsive_layout.dart';

class NavbarView extends StatelessWidget {
  final PortfolioController controller;

  const NavbarView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0F1D).withValues(alpha: 0.90),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.08),
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Logo
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => controller.scrollTo(controller.heroKey),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00D2FF), Color(0xFF7928CA)],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF00D2FF).withValues(alpha: 0.4),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: const Text("⚡", style: TextStyle(fontSize: 16)),
                      ),
                      const SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          text: "Ritesh",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          children: const [
                            TextSpan(
                              text: ".flutter",
                              style: TextStyle(color: Color(0xFF00D2FF)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (isMobile)
                Builder(
                  builder: (ctx) => IconButton(
                    icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 28),
                    onPressed: () => Scaffold.of(ctx).openDrawer(),
                    tooltip: 'Menu',
                  ),
                )
              else
                Row(
                  children: [
                    _navItem("About", () => controller.scrollTo(controller.aboutKey)),
                    _navItem("Skills", () => controller.scrollTo(controller.skillsKey)),
                    _navItem("Experience", () => controller.scrollTo(controller.experienceKey)),
                    _navItem("Projects", () => controller.scrollTo(controller.projectsKey)),
                    _navItem("Education", () => controller.scrollTo(controller.educationKey)),
                    _navItem("Contact", () => controller.scrollTo(controller.contactKey)),
                    const SizedBox(width: 14),
                    ElevatedButton(
                      onPressed: () => controller.scrollTo(controller.contactKey),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00D2FF),
                        foregroundColor: const Color(0xFF050B14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        elevation: 6,
                      ),
                      child: Text(
                        "Hire Me",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF94A3B8),
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
