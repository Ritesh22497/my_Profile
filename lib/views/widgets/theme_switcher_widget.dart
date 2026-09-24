import 'package:flutter/material.dart';
import '../../controllers/portfolio_controller.dart';

class ThemeSwitcherWidget extends StatelessWidget {
  final PortfolioController controller;
  final bool isCompact;

  const ThemeSwitcherWidget({
    super.key,
    required this.controller,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final themes = PortfolioController.accentThemes;
        final selectedIndex = controller.selectedThemeIndex;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 4 : 8,
            vertical: isCompact ? 3 : 6,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.12),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isCompact) ...[
                const Icon(
                  Icons.palette_outlined,
                  size: 16,
                  color: Colors.white70,
                ),
                const SizedBox(width: 8),
              ],
              ...List.generate(themes.length, (index) {
                final theme = themes[index];
                final isSelected = selectedIndex == index;

                return Tooltip(
                  message: "${theme.name} Theme",
                  child: InkWell(
                    onTap: () => controller.setThemeIndex(index),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: isCompact ? 1.5 : 3),
                      padding: EdgeInsets.all(isCompact ? 1.5 : 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.white : Colors.transparent,
                          width: isCompact ? 1.2 : 1.8,
                        ),
                        boxShadow:
                            isSelected
                                ? [
                                  BoxShadow(
                                    color: theme.primary.withValues(alpha: 0.6),
                                    blurRadius: isCompact ? 4 : 6,
                                    spreadRadius: isCompact ? 0.5 : 1,
                                  ),
                                ]
                                : null,
                      ),
                      child: Container(
                        width: isCompact ? 11 : 18,
                        height: isCompact ? 11 : 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [theme.primary, theme.secondary],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
