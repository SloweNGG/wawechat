import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/l10n.dart';

enum AuthMode { signIn, signUp }

/// Giriş Yap / Kayıt Ol arasında kayan geçişli seçici.
class AuthModeToggle extends StatelessWidget {
  const AuthModeToggle({
    super.key,
    required this.mode,
    required this.onChanged,
  });

  final AuthMode mode;
  final ValueChanged<AuthMode> onChanged;

  static const _duration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final labelStyle = Theme.of(context).textTheme.labelLarge;

    return Container(
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppTheme.borderRadius,
        border: Border.all(color: AppColors.border),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedAlign(
            alignment: mode == AuthMode.signIn
                ? Alignment.centerLeft
                : Alignment.centerRight,
            duration: _duration,
            curve: Curves.easeOutCubic,
            child: const FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: AppColors.accentGradient,
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppTheme.radius - 4)),
                ),
              ),
            ),
          ),
          Row(
            children: [
              for (final (value, label) in [
                (AuthMode.signIn, l10n.authSignInTab),
                (AuthMode.signUp, l10n.authSignUpTab),
              ])
                Expanded(
                  child: Semantics(
                    button: true,
                    selected: mode == value,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onChanged(value),
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: _duration,
                          style: labelStyle!.copyWith(
                            color: mode == value
                                ? Colors.white
                                : AppColors.textMuted,
                          ),
                          child: Text(label),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
