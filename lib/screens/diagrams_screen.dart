import 'package:flutter/material.dart';

class DiagramsScreen extends StatelessWidget {
  const DiagramsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB8A5D6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF5A5A5A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Diagrammes',
          style: TextStyle(
            color: Color(0xFF5A5A5A),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Pie Chart
                    Expanded(
                      child: CustomPaint(
                        size: const Size(150, 150),
                        painter: PieChartPainter(),
                      ),
                    ),
                    
                    const SizedBox(width: 30),
                    
                    // Legend
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLegendItem(const Color(0xFFB3D9D9)),
                        _buildLegendItem(const Color(0xFFE5A5C5)),
                        _buildLegendItem(const Color(0xFFB8A5D6)),
                        _buildLegendItem(const Color(0xFFB0B0B0)),
                      ],
                    ),
                    
                    const SizedBox(width: 30),
                    
                    // Bar Chart
                    Expanded(
                      child: CustomPaint(
                        size: const Size(150, 150),
                        painter: BarChartPainter(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Bottom section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: const Color(0xFFB8A5D6),
            child: const Text(
              'le rapport hebdomadaires',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 40,
            height: 2,
            color: const Color(0xFFE0E0E0),
          ),
        ],
      ),
    );
  }
}

// Pie Chart Painter
class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Draw pie slices
    paint.color = const Color(0xFFB8A5D6);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5708, // Start at top
      1.5708, // 90 degrees
      true,
      paint,
    );
    
    paint.color = const Color(0xFFE5A5C5);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2.0944, // 120 degrees
      true,
      paint,
    );
    
    paint.color = const Color(0xFFB3D9D9);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      2.0944,
      1.0472, // 60 degrees
      true,
      paint,
    );
    
    paint.color = const Color(0xFFB0B0B0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14159,
      1.5708, // 90 degrees
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Bar Chart Painter
class BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Base line
    paint.color = const Color(0xFF2C3E50);
    paint.strokeWidth = 3;
    canvas.drawLine(
      Offset(0, size.height - 10),
      Offset(size.width, size.height - 10),
      paint,
    );
    
    // Bars
    final barWidth = size.width / 5;
    final barColors = [
      const Color(0xFFB8A5D6),
      const Color(0xFFB8A5D6),
      const Color(0xFFB8A5D6),
    ];
    final barHeights = [0.4, 0.6, 0.8];
    
    paint.style = PaintingStyle.fill;
    for (int i = 0; i < 3; i++) {
      paint.color = barColors[i];
      final left = barWidth * (i + 0.5);
      final barHeight = (size.height - 20) * barHeights[i];
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            left,
            size.height - 10 - barHeight,
            barWidth * 0.6,
            barHeight,
          ),
          const Radius.circular(4),
        ),
        paint,
      );
    }
    
    // Growth arrow
    final arrowPaint = Paint()
      ..color = const Color(0xFF2C3E50)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    
    final arrowPath = Path();
    arrowPath.moveTo(size.width * 0.2, size.height * 0.7);
    arrowPath.lineTo(size.width * 0.4, size.height * 0.5);
    arrowPath.lineTo(size.width * 0.6, size.height * 0.4);
    arrowPath.lineTo(size.width * 0.8, size.height * 0.2);
    arrowPath.lineTo(size.width * 0.95, size.height * 0.05);
    
    canvas.drawPath(arrowPath, arrowPaint);
    
    // Arrow head
    final arrowHeadPath = Path();
    arrowHeadPath.moveTo(size.width * 0.95, size.height * 0.05);
    arrowHeadPath.lineTo(size.width * 0.85, size.height * 0.1);
    arrowHeadPath.moveTo(size.width * 0.95, size.height * 0.05);
    arrowHeadPath.lineTo(size.width * 0.9, size.height * 0.15);
    
    canvas.drawPath(arrowHeadPath, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}