import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_model.dart';
import 'dashboard_simulator.dart';
import 'phone_mockup_viewer.dart';

class ProjectDialog extends StatefulWidget {
  final ProjectModel project;
  final PortfolioController? controller;

  const ProjectDialog({
    super.key,
    required this.project,
    this.controller,
  });

  static void show(
    BuildContext context,
    ProjectModel project, {
    PortfolioController? controller,
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.82),
      builder: (_) => ProjectDialog(project: project, controller: controller),
    );
  }

  @override
  State<ProjectDialog> createState() => _ProjectDialogState();
}

class _ProjectDialogState extends State<ProjectDialog> {
  int _activeTab = 0;

  Future<void> _openPlayStore() async {
    final url = widget.project.playStoreUrl;
    if (url == null) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final accent = widget.controller?.accentColor ?? const Color(0xFF00D2FF);
    final screenW = MediaQuery.of(context).size.width;
    final isMobile = screenW < 600;
    final hasMockups = widget.project.screenMockups != null &&
        widget.project.screenMockups!.isNotEmpty;
    final hasSimulator = widget.project.id == "as-pujari-ji" ||
        widget.project.id == "pujari-ji";

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 20,
        vertical: isMobile ? 16 : 24,
      ),
      child: Container(
        width: 720,
        constraints: BoxConstraints(maxHeight: isMobile ? 650 : 740),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: accent.withValues(alpha: 0.35),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: accent.withValues(alpha: 0.22),
              blurRadius: 35,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: EdgeInsets.all(isMobile ? 16 : 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Row(
              children: [
                Text(
                  widget.project.icon,
                  style: TextStyle(fontSize: isMobile ? 26 : 32),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 17 : 21,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.project.subtitle,
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 11 : 12.5,
                          fontWeight: FontWeight.w600,
                          color: accent,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (widget.project.playStoreUrl != null) ...[
                  if (isMobile)
                    IconButton(
                      icon: const Icon(Icons.shop_two_rounded, color: Color(0xFF10B981), size: 22),
                      tooltip: "Google Play",
                      onPressed: _openPlayStore,
                    )
                  else
                    ElevatedButton.icon(
                      onPressed: _openPlayStore,
                      icon: const Icon(Icons.shop_two_rounded, size: 16),
                      label: Text(
                        "Google Play",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 4,
                      ),
                    ),
                  const SizedBox(width: 4),
                ],
                IconButton(
                  icon: const Icon(Icons.close_rounded, color: Colors.white70),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: 'Close',
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Dialog Tab Bar (Specs vs App Mockups vs Live Simulator)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _tabChip(0, "📋 Specs & Details", accent),
                  if (hasMockups) ...[
                    const SizedBox(width: 8),
                    _tabChip(1, "📱 App Screen Mockups", accent),
                  ],
                  if (hasSimulator) ...[
                    const SizedBox(width: 8),
                    _tabChip(2, "⚡ Live Simulator", accent),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: Colors.white12),
            const SizedBox(height: 10),

            // Scrollable Tab View Content
            Expanded(
              child: SingleChildScrollView(
                child: _buildActiveTabContent(accent, hasMockups, hasSimulator),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabChip(int index, String label, Color accent) {
    final isSelected = _activeTab == index;

    return InkWell(
      onTap: () => setState(() => _activeTab = index),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? accent.withValues(alpha: 0.18)
              : const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? accent : Colors.white12,
            width: 1.4,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12.5,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? accent : const Color(0xFF94A3B8),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveTabContent(Color accent, bool hasMockups, bool hasSimulator) {
    if (_activeTab == 1 && hasMockups) {
      return PhoneMockupViewer(
        project: widget.project,
        accentColor: accent,
      );
    }

    if (_activeTab == 2 && hasSimulator) {
      return DashboardSimulator(
        projectId: widget.project.id,
        accentColor: accent,
      );
    }

    // Default: Specs & Details Tab
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overview",
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          widget.project.description,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: const Color(0xFF94A3B8),
            height: 1.6,
          ),
        ),
        if (widget.project.keyFeatures != null &&
            widget.project.keyFeatures!.isNotEmpty) ...[
          const SizedBox(height: 18),
          Text(
            "Key Features & Modules",
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.project.keyFeatures!.map(
              (feature) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: accent.withValues(alpha: 0.25),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      size: 14,
                      color: accent,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      feature,
                      style: GoogleFonts.inter(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFE2E8F0),
                      ),
                    ),
                  ],
                ),
              ),
            ).toList(),
          ),
        ],
        const SizedBox(height: 18),
        Text(
          "Architectural Highlights",
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        ...widget.project.highlights.map(
          (h) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "▹ ",
                  style: TextStyle(
                    color: accent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Text(
                    h,
                    style: GoogleFonts.inter(
                      fontSize: 13.5,
                      color: const Color(0xFFCBD5E1),
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          "Full Tech Stack & Tools",
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: widget.project.techStack.map(
            (tech) => Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: accent.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                tech,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: accent,
                ),
              ),
            ),
          ).toList(),
        ),
      ],
    );
  }
}
