import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/portfolio_model.dart';

class PhoneMockupViewer extends StatefulWidget {
  final ProjectModel project;
  final Color accentColor;

  const PhoneMockupViewer({
    super.key,
    required this.project,
    required this.accentColor,
  });

  @override
  State<PhoneMockupViewer> createState() => _PhoneMockupViewerState();
}

class _PhoneMockupViewerState extends State<PhoneMockupViewer> {
  int _activeScreenIndex = 0;
  String _interactionFeedback = "";

  @override
  Widget build(BuildContext context) {
    final mockups = widget.project.screenMockups;
    if (mockups == null || mockups.isEmpty) {
      return const SizedBox.shrink();
    }

    final currentScreen = mockups[_activeScreenIndex.clamp(0, mockups.length - 1)];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Screen Tab Selector
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(mockups.length, (idx) {
              final isSelected = _activeScreenIndex == idx;
              final screen = mockups[idx];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  avatar: Icon(
                    screen.icon,
                    size: 16,
                    color: isSelected ? Colors.white : widget.accentColor,
                  ),
                  label: Text(
                    screen.title,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected ? Colors.white : const Color(0xFFCBD5E1),
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: widget.accentColor.withValues(alpha: 0.35),
                  backgroundColor: const Color(0xFF1E293B),
                  side: BorderSide(
                    color: isSelected ? widget.accentColor : Colors.white12,
                    width: 1.2,
                  ),
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _activeScreenIndex = idx;
                        _interactionFeedback = "";
                      });
                    }
                  },
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 14),

        // Realistic Smartphone Mockup Frame
        Center(
          child: Container(
            width: 320,
            constraints: const BoxConstraints(minHeight: 460),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF020617),
              borderRadius: BorderRadius.circular(36),
              border: Border.all(
                color: widget.accentColor.withValues(alpha: 0.5),
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.accentColor.withValues(alpha: 0.22),
                  blurRadius: 30,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.8),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Phone Top Island & Speaker Slit
                Container(
                  width: 90,
                  height: 18,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white12, width: 0.8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: Color(0xFF334155),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 35,
                        height: 3,
                        decoration: BoxDecoration(
                          color: const Color(0xFF334155),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),

                // Status Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "9:41",
                        style: GoogleFonts.inter(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.wifi_rounded, size: 12, color: Colors.white),
                          SizedBox(width: 4),
                          Icon(Icons.signal_cellular_alt_rounded, size: 12, color: Colors.white),
                          SizedBox(width: 4),
                          Icon(Icons.battery_full_rounded, size: 14, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // In-App Screen Content Container
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0B132B),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // App Screen Header
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: currentScreen.themeColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              currentScreen.icon,
                              size: 16,
                              color: currentScreen.themeColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentScreen.title,
                                  style: GoogleFonts.inter(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  currentScreen.subtitle,
                                  style: GoogleFonts.inter(
                                    fontSize: 9.5,
                                    color: const Color(0xFF94A3B8),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.white12, height: 1),
                      const SizedBox(height: 10),

                      // Screen Feature Cards
                      ...currentScreen.cards.map((card) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E293B).withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: card.iconColor.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(card.icon, size: 16, color: card.iconColor),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      card.title,
                                      style: GoogleFonts.inter(
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  if (card.badge != null)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: card.iconColor.withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        card.badge!,
                                        style: GoogleFonts.inter(
                                          fontSize: 8.5,
                                          fontWeight: FontWeight.w700,
                                          color: card.iconColor,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                card.subtitle,
                                style: GoogleFonts.inter(
                                  fontSize: 10.5,
                                  color: const Color(0xFF94A3B8),
                                  height: 1.3,
                                ),
                              ),
                              if (card.actionText != null) ...[
                                const SizedBox(height: 6),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _interactionFeedback =
                                            "Tapped: ${card.actionText} on ${card.title}";
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(6),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: card.iconColor.withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        card.actionText!,
                                        style: GoogleFonts.inter(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: card.iconColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        );
                      }),

                      // Interaction Feedback Banner inside Mockup
                      if (_interactionFeedback.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle_rounded,
                                size: 12,
                                color: Color(0xFF10B981),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  _interactionFeedback,
                                  style: GoogleFonts.inter(
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF10B981),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Phone Home Indicator Bar
                Container(
                  width: 90,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
