import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/portfolio_controller.dart';
import '../widgets/theme_switcher_widget.dart';

class NavbarView extends StatelessWidget {
  final PortfolioController controller;

  const NavbarView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isDesktop = screenWidth >= 1024;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A0F1D).withValues(alpha: 0.94),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.08),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        top: true,
        bottom: false,
        left: true,
        right: true,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 24,
            vertical: isMobile ? 8 : 12,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Brand Logo - Wrapped in Expanded to completely prevent horizontal overflow
                  Expanded(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => controller.scrollTo(controller.heroKey),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(isMobile ? 5 : 7),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF00D2FF), Color(0xFF7928CA)],
                                ),
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: [
                                  BoxShadow(
                                    color: controller.accentColor.withValues(alpha: 0.35),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: Text(
                                "⚡",
                                style: TextStyle(fontSize: isMobile ? 13 : 15),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: "Ritesh",
                                  style: GoogleFonts.inter(
                                    fontSize: isMobile ? 16 : 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ".flutter",
                                      style: TextStyle(color: controller.accentColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  if (!isDesktop)
                    // Mobile & Tablet: Compact Controls
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ThemeSwitcherWidget(
                          controller: controller,
                          isCompact: true,
                        ),
                        const SizedBox(width: 4),
                        Builder(
                          builder: (ctx) => IconButton(
                            icon: const Icon(
                              Icons.menu_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                            padding: const EdgeInsets.all(6),
                            constraints: const BoxConstraints(
                              minWidth: 36,
                              minHeight: 36,
                            ),
                            onPressed: () => Scaffold.of(ctx).openDrawer(),
                            tooltip: 'Menu',
                          ),
                        ),
                      ],
                    )
                  else
                    // Desktop: Full Menu Bar wrapped safely in scrollable flex
                    Flexible(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _navItem("About", () => controller.scrollTo(controller.aboutKey)),
                            _navItem("Skills", () => controller.scrollTo(controller.skillsKey)),
                            _navItem("Experience", () => controller.scrollTo(controller.experienceKey)),
                            _navItem("Projects", () => controller.scrollTo(controller.projectsKey)),
                            _navItem("Education", () => controller.scrollTo(controller.educationKey)),
                            _navItem("Contact", () => controller.scrollTo(controller.contactKey)),
                            const SizedBox(width: 12),
                            ThemeSwitcherWidget(controller: controller),
                            const SizedBox(width: 14),
                            ElevatedButton(
                              onPressed: () => controller.scrollTo(controller.contactKey),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.accentColor,
                                foregroundColor: const Color(0xFF050B14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
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
                      ),
                    ),
                ],
              ),
            ),
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
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
