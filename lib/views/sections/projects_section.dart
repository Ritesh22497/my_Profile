import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/portfolio_controller.dart';
import '../widgets/glass_card.dart';
import '../widgets/project_dialog.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/section_header.dart';

class ProjectsSection extends StatelessWidget {
  final PortfolioController controller;

  const ProjectsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    // Calculate responsive card width
    final screenWidth = MediaQuery.of(context).size.width;
    double cardWidth;
    if (isMobile) {
      cardWidth = screenWidth - 48;
    } else if (isTablet) {
      cardWidth = (screenWidth - 72) / 2;
    } else {
      cardWidth = 370;
    }

    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final filtered = controller.filteredProjects;

        return Container(
          key: controller.projectsKey,
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
                    badge: "Case Studies",
                    title: "Key Projects & Applications (11)",
                    subtitle:
                        "10+ production-grade mobile platforms built with Flutter, Riverpod, Agora, Firebase & Payment Gateways.",
                  ),
                  const SizedBox(height: 24),

                  // Filter Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _filterChip("all", "All Projects (11)"),
                        _filterChip("production", "Production Apps"),
                        _filterChip("enterprise", "Enterprise & HRMS"),
                        _filterChip("media", "Video & Real-Time"),
                        _filterChip("tools", "Canvas & Offline"),
                        _filterChip("ecommerce", "E-Commerce"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),

                  // Responsive Projects Grid
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: filtered.map((p) {
                      return SizedBox(
                        width: cardWidth,
                        child: GlassCard(
                          onTap: () => ProjectDialog.show(context, p),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF00D2FF).withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      p.badge,
                                      style: GoogleFonts.inter(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF00D2FF),
                                      ),
                                    ),
                                  ),
                                  Text(p.icon, style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                p.title,
                                style: GoogleFonts.inter(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                p.subtitle,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF00D2FF),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                p.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: const Color(0xFF94A3B8),
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: p.techStack.take(3).map((t) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha: 0.05),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      t,
                                      style: GoogleFonts.jetBrainsMono(
                                        fontSize: 10.5,
                                        color: const Color(0xFFCBD5E1),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 16),
                              const Divider(color: Colors.white12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Click for architecture details",
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      color: const Color(0xFF64748B),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 16,
                                    color: Color(0xFF00D2FF),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _filterChip(String category, String label) {
    final isSelected = controller.selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (val) {
          if (val) {
            controller.setCategory(category);
          }
        },
        selectedColor: const Color(0xFF00D2FF).withValues(alpha: 0.25),
        backgroundColor: Colors.white.withValues(alpha: 0.04),
        side: BorderSide(
          color: isSelected
              ? const Color(0xFF00D2FF)
              : Colors.white.withValues(alpha: 0.1),
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: isSelected ? const Color(0xFF00D2FF) : const Color(0xFF94A3B8),
        ),
      ),
    );
  }
}
