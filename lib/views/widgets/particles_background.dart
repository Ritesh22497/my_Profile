import 'dart:math';
import 'package:flutter/material.dart';

class ParticlesBackground extends StatefulWidget {
  final Widget child;
  const ParticlesBackground({super.key, required this.child});

  @override
  State<ParticlesBackground> createState() => _ParticlesBackgroundState();
}

class _ParticlesBackgroundState extends State<ParticlesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = [];
  final Random _random = Random();
  final int _particleCount = 45;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    for (int i = 0; i < _particleCount; i++) {
      _particles.add(
        _Particle(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          vx: (_random.nextDouble() - 0.5) * 0.0012,
          vy: (_random.nextDouble() - 0.5) * 0.0012,
          radius: _random.nextDouble() * 2.2 + 1.2,
          isCyan: _random.nextBool(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base dark cyber gradient
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0A0F1D),
            gradient: RadialGradient(
              center: Alignment(0.7, -0.7),
              radius: 1.2,
              colors: [
                Color(0x1F00D2FF),
                Color(0x107928CA),
                Color(0xFF0A0F1D),
              ],
            ),
          ),
        ),
        // Animated particles canvas
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            for (var p in _particles) {
              p.x += p.vx;
              p.y += p.vy;
              if (p.x < 0) p.x = 1.0;
              if (p.x > 1.0) p.x = 0;
              if (p.y < 0) p.y = 1.0;
              if (p.y > 1.0) p.y = 0;
            }
            return CustomPaint(
              size: Size.infinite,
              painter: _ParticlePainter(_particles),
            );
          },
        ),
        // Child content
        widget.child,
      ],
    );
  }
}

class _Particle {
  double x;
  double y;
  double vx;
  double vy;
  double radius;
  bool isCyan;

  _Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.radius,
    required this.isCyan,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;

  _ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final cyanPaint = Paint()..color = const Color(0x6600D2FF);
    final violetPaint = Paint()..color = const Color(0x668B5CF6);
    final linePaint = Paint()
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < particles.length; i++) {
      final p1 = particles[i];
      final pos1 = Offset(p1.x * size.width, p1.y * size.height);
      canvas.drawCircle(pos1, p1.radius, p1.isCyan ? cyanPaint : violetPaint);

      // Connect near particles
      for (int j = i + 1; j < particles.length; j++) {
        final p2 = particles[j];
        final pos2 = Offset(p2.x * size.width, p2.y * size.height);
        final dist = (pos1 - pos2).distance;

        if (dist < 100) {
          final opacity = (1.0 - (dist / 100)) * 0.25;
          linePaint.color = Color.fromRGBO(0, 210, 255, opacity);
          canvas.drawLine(pos1, pos2, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
