import 'package:flutter/material.dart';
import 'dart:async';
import 'logo_subtitle_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LogoSubtitleScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: CustomPaint(
            size: const Size(120, 120),
            painter: HeartLogoPainter(),
          ),
        ),
      ),
    );
  }
}

class HeartLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Create heart shape
    path.moveTo(size.width / 2, size.height * 0.35);
    
    // Left curve
    path.cubicTo(
      size.width * 0.2, size.height * 0.1,
      -size.width * 0.25, size.height * 0.4,
      size.width / 2, size.height * 0.95,
    );
    
    // Right curve
    path.moveTo(size.width / 2, size.height * 0.35);
    path.cubicTo(
      size.width * 0.8, size.height * 0.1,
      size.width * 1.25, size.height * 0.4,
      size.width / 2, size.height * 0.95,
    );

    // Top purple section
    paint.color = const Color(0xFFB8A5D6);
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height * 0.33));
    canvas.drawPath(path, paint);
    canvas.restore();

    // Middle pink section
    paint.color = const Color(0xFFE5A5C5);
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, size.height * 0.33, size.width, size.height * 0.34));
    canvas.drawPath(path, paint);
    canvas.restore();

    // Bottom teal section
    paint.color = const Color(0xFFB3D9D9);
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, size.height * 0.67, size.width, size.height * 0.33));
    canvas.drawPath(path, paint);
    canvas.restore();

    // Draw the wave line
    final wavePaint = Paint()
      ..color = const Color(0xFF5A7B7B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final wavePath = Path();
    wavePath.moveTo(size.width * 0.3, size.height * 0.5);
    wavePath.quadraticBezierTo(
      size.width * 0.4, size.height * 0.45,
      size.width * 0.5, size.height * 0.5,
    );
    wavePath.quadraticBezierTo(
      size.width * 0.6, size.height * 0.55,
      size.width * 0.7, size.height * 0.5,
    );

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}