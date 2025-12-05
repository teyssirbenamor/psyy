import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';

class LogoSubtitleScreen extends StatefulWidget {
  const LogoSubtitleScreen({Key? key}) : super(key: key);

  @override
  State<LogoSubtitleScreen> createState() => _LogoSubtitleScreenState();
}

class _LogoSubtitleScreenState extends State<LogoSubtitleScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
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
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    size: const Size(60, 60),
                    painter: HeartLogoPainter(),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'PSY en POCHE',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5A7B8C),
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Votre assistant en un Bouton',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8A9BA8),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
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
    
    path.moveTo(size.width / 2, size.height * 0.35);
    path.cubicTo(
      size.width * 0.2, size.height * 0.1,
      -size.width * 0.25, size.height * 0.4,
      size.width / 2, size.height * 0.95,
    );
    
    path.moveTo(size.width / 2, size.height * 0.35);
    path.cubicTo(
      size.width * 0.8, size.height * 0.1,
      size.width * 1.25, size.height * 0.4,
      size.width / 2, size.height * 0.95,
    );

    paint.color = const Color(0xFFB8A5D6);
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height * 0.33));
    canvas.drawPath(path, paint);
    canvas.restore();

    paint.color = const Color(0xFFE5A5C5);
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, size.height * 0.33, size.width, size.height * 0.34));
    canvas.drawPath(path, paint);
    canvas.restore();

    paint.color = const Color(0xFFB3D9D9);
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, size.height * 0.67, size.width, size.height * 0.33));
    canvas.drawPath(path, paint);
    canvas.restore();

    final wavePaint = Paint()
      ..color = const Color(0xFF5A7B7B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

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