import 'package:flutter/material.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final VoidCallback? onTap;
  final Color? borderColor;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 18.0,
    this.onTap,
    this.borderColor,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final border = Border.all(
      color: _isHovered
          ? (widget.borderColor ?? const Color(0xFF00D2FF).withValues(alpha: 0.6))
          : (widget.borderColor ?? Colors.white.withValues(alpha: 0.1)),
      width: _isHovered ? 1.4 : 1.0,
    );

    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOut,
          margin: widget.margin,
          padding: widget.padding ?? const EdgeInsets.all(22.0),
          transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
          decoration: BoxDecoration(
            color: _isHovered
                ? const Color(0xFF162036).withValues(alpha: 0.85)
                : const Color(0xFF0F172A).withValues(alpha: 0.72),
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: border,
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? const Color(0xFF00D2FF).withValues(alpha: 0.18)
                    : Colors.black.withValues(alpha: 0.35),
                blurRadius: _isHovered ? 24 : 14,
                offset: Offset(0, _isHovered ? 10 : 6),
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
