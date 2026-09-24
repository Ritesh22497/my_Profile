import 'package:flutter/material.dart';
import '../../controllers/portfolio_controller.dart';

class ScrollProgressButton extends StatelessWidget {
  final PortfolioController controller;

  const ScrollProgressButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final isVisible = controller.showBackToTop;
        final progress = controller.scrollProgress;
        final accent = controller.accentColor;

        return AnimatedPositioned(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          right: 24,
          bottom: isVisible ? 28 : -80,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isVisible ? 1.0 : 0.0,
            child: Material(
              color: Colors.transparent,
              child: Tooltip(
                message: "Back to top (${(progress * 100).toInt()}%)",
                child: InkWell(
                  onTap: () => controller.scrollToTop(),
                  borderRadius: BorderRadius.circular(28),
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF0F172A).withValues(alpha: 0.92),
                      border: Border.all(
                        color: accent.withValues(alpha: 0.4),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: accent.withValues(alpha: 0.35),
                          blurRadius: 18,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Circular Progress Indicator
                        SizedBox(
                          width: 46,
                          height: 46,
                          child: CircularProgressIndicator(
                            value: progress,
                            strokeWidth: 3,
                            backgroundColor: Colors.white12,
                            valueColor: AlwaysStoppedAnimation<Color>(accent),
                          ),
                        ),
                        // Up Arrow Icon
                        Icon(
                          Icons.arrow_upward_rounded,
                          size: 22,
                          color: accent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
