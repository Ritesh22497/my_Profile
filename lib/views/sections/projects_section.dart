import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';
import '../widgets/glass_card.dart';
import '../widgets/project_dialog.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/section_header.dart';

class ProjectsSection extends StatefulWidget {
  final PortfolioController controller;

  const ProjectsSection({super.key, required this.controller});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.controller.searchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);
    final accent = controller.accentColor;

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
                    badge: "Production Portfolio",
                    title: "Key Projects & Applications (11)",
                    subtitle:
                        "Production-grade mobile platforms built with Flutter, Riverpod, Agora, Firebase & Payment Gateways.",
                  ),
                  const SizedBox(height: 24),

                  // Search Bar
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 550),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F172A).withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: accent.withValues(alpha: 0.3),
                          width: 1.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: accent.withValues(alpha: 0.1),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        onChanged: (val) => controller.setSearchQuery(val),
                        decoration: InputDecoration(
                          hintText: "Search by keyword, tech (Agora, Firebase) or feature...",
                          hintStyle: GoogleFonts.inter(
                            color: const Color(0xFF64748B),
                            fontSize: 13.5,
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: accent,
                            size: 20,
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear_rounded, size: 18, color: Colors.white70),
                                  onPressed: () {
                                    _searchController.clear();
                                    controller.clearSearch();
                                  },
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                      ),
                    ),
                  ),

                  // Filter Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _filterChip("all", "All Projects (11)", accent),
                        _filterChip("production", "Production Apps", accent),
                        _filterChip("enterprise", "Enterprise & HRMS", accent),
                        _filterChip("media", "Video & Real-Time", accent),
                        _filterChip("tools", "Canvas & Offline", accent),
                        _filterChip("ecommerce", "E-Commerce", accent),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Results Count Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Showing ${filtered.length} of ${PortfolioData.projects.length} projects",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF94A3B8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (controller.searchQuery.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            _searchController.clear();
                            controller.clearSearch();
                          },
                          child: Text(
                            "• Clear search",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: accent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 28),

                  // Empty State if no project matches search
                  if (filtered.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F172A).withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.search_off_rounded, size: 48, color: Colors.white38),
                          const SizedBox(height: 12),
                          Text(
                            "No projects found matching '${controller.searchQuery}'",
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Try searching for 'Agora', 'Razorpay', 'Pooja', 'HRMS' or select another category.",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: const Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    // Responsive Projects Grid
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: filtered.map((p) {
                        final hasPlayStore = p.playStoreUrl != null;
                        final hasSimulator = p.id == "pujari-ji" || p.id == "as-pujari-ji";

                        return SizedBox(
                          width: cardWidth,
                          child: GlassCard(
                            onTap: () => ProjectDialog.show(context, p, controller: controller),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Wrap(
                                        spacing: 6,
                                        runSpacing: 4,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: accent.withValues(alpha: 0.12),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              p.badge,
                                              style: GoogleFonts.inter(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                                color: accent,
                                              ),
                                            ),
                                          ),
                                          if (hasPlayStore)
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF10B981).withValues(alpha: 0.15),
                                                borderRadius: BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: const Color(0xFF10B981).withValues(alpha: 0.35),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Icon(
                                                    Icons.shop_two_rounded,
                                                    size: 11,
                                                    color: Color(0xFF10B981),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    "Play Store",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w700,
                                                      color: const Color(0xFF10B981),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (hasSimulator)
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 7,
                                                vertical: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFA855F7).withValues(alpha: 0.18),
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Text(
                                                "⚡ Simulator",
                                                style: GoogleFonts.inter(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  color: const Color(0xFFA855F7),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
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
                                    color: accent,
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
                                    Expanded(
                                      child: Text(
                                        hasSimulator
                                            ? "Click to test Live Simulator & Specs"
                                            : (p.screenMockups != null
                                                ? "Click to view UI Mockup & Specs"
                                                : "Click for architecture details"),
                                        style: GoogleFonts.inter(
                                          fontSize: 11,
                                          color: const Color(0xFF64748B),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 16,
                                      color: accent,
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

  Widget _filterChip(String category, String label, Color accent) {
    final isSelected = widget.controller.selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (val) {
          if (val) {
            widget.controller.setCategory(category);
          }
        },
        selectedColor: accent.withValues(alpha: 0.25),
        backgroundColor: Colors.white.withValues(alpha: 0.04),
        side: BorderSide(
          color: isSelected
              ? accent
              : Colors.white.withValues(alpha: 0.1),
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: isSelected ? accent : const Color(0xFF94A3B8),
        ),
      ),
    );
  }
}
