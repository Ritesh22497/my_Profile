import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/portfolio_model.dart';

class ProjectDialog extends StatelessWidget {
  final ProjectModel project;

  const ProjectDialog({super.key, required this.project});

  static void show(BuildContext context, ProjectModel project) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.78),
      builder: (_) => ProjectDialog(project: project),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        width: 650,
        constraints: const BoxConstraints(maxHeight: 680),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFF00D2FF).withValues(alpha: 0.35),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00D2FF).withValues(alpha: 0.2),
              blurRadius: 35,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Row(
              children: [
                Text(
                  project.icon,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.title,
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        project.subtitle,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF00D2FF),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded, color: Colors.white70),
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: 'Close',
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.white12),
            const SizedBox(height: 12),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                      project.description,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF94A3B8),
                        height: 1.6,
                      ),
                    ),
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
                    ...project.highlights.map(
                      (h) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "▹ ",
                              style: TextStyle(
                                color: Color(0xFF00D2FF),
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
                    if (project.keyFeatures != null &&
                        project.keyFeatures!.isNotEmpty) ...[
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
                        children: project.keyFeatures!.map(
                          (feature) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00D2FF).withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFF00D2FF).withValues(alpha: 0.25),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.check_circle_rounded,
                                  size: 14,
                                  color: Color(0xFF00D2FF),
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
                      children: project.techStack.map(
                        (tech) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF00D2FF).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFF00D2FF).withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            tech,
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF00D2FF),
                            ),
                          ),
                        ),
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
