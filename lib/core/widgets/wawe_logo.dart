import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../theme/app_colors.dart';

/// Geçişli simge + "WaweChat" yazısı.
class WaweLogo extends StatelessWidget {
  const WaweLogo({super.key, this.fontSize = 34});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final markSize = fontSize * 1.9;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: markSize,
          height: markSize,
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: BorderRadius.circular(markSize * 0.28),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary.withValues(alpha: 0.35),
                blurRadius: 28,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Icon(
            Icons.waves_rounded,
            color: Colors.white,
            size: markSize * 0.55,
          ),
        ),
        SizedBox(height: fontSize * 0.5),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: AppColors.accentGradient.createShader,
          child: Text(
            context.l10n.appName,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
          ),
        ),
      ],
    );
  }
}
