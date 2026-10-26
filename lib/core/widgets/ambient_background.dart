import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Köşelerde yumuşak mor ve pembe ışıltılar olan koyu arka plan.
/// Karşılama/onboarding ekranlarında kullanılır.
class AmbientBackground extends StatelessWidget {
  const AmbientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Positioned(
          top: -140,
          left: -100,
          child: _Glow(color: AppColors.secondary, size: 360),
        ),
        const Positioned(
          bottom: -160,
          right: -120,
          child: _Glow(color: AppColors.primary, size: 380),
        ),
        child,
      ],
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: 0.32),
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}
