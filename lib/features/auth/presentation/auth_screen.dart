import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/wawe_logo.dart';
import '../../../data/mock/mock_auth_service.dart';
import '../../../l10n/l10n.dart';
import 'widgets/auth_mode_toggle.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, this.authService = const MockAuthService()});

  final MockAuthService authService;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  AuthMode _mode = AuthMode.signIn;
  bool _obscurePassword = true;
  bool _loading = false;

  bool get _isSignUp => _mode == AuthMode.signUp;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _setMode(AuthMode mode) {
    if (mode == _mode || _loading) return;
    setState(() {
      _mode = mode;
      _confirmController.clear();
    });
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text;
    await _runWithLoading(
      () => _isSignUp
          ? widget.authService.signUp(email: email, password: password)
          : widget.authService.signIn(email: email, password: password),
    );
    if (mounted) _onAuthenticated();
  }

  Future<void> _continueWith(AuthProvider provider) async {
    await _runWithLoading(
      () => widget.authService.signInWithProvider(provider),
    );
    if (mounted) _onAuthenticated();
  }

  Future<void> _forgotPassword() async {
    await widget.authService.sendPasswordReset(_emailController.text.trim());
    if (mounted) _showMessage(context.l10n.authForgotPasswordSent);
  }

  Future<void> _runWithLoading(Future<void> Function() action) async {
    setState(() => _loading = true);
    try {
      await action();
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _onAuthenticated() {
    // TODO: Kayıt → doğum tarihi ekranı, giriş → ana yapı (sonraki adımlarda).
    final l10n = context.l10n;
    _showMessage(_isSignUp ? l10n.authAccountCreated : l10n.authWelcomeBack);
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  String? _validateEmail(String? value) {
    final l10n = context.l10n;
    if (value == null || value.trim().isEmpty) {
      return l10n.validationEmailRequired;
    }
    if (!Validators.isValidEmail(value)) return l10n.validationEmailInvalid;
    return null;
  }

  String? _validatePassword(String? value) {
    final l10n = context.l10n;
    if (value == null || value.isEmpty) return l10n.validationPasswordRequired;
    if (_isSignUp && value.length < Validators.minPasswordLength) {
      return l10n.validationPasswordTooShort(Validators.minPasswordLength);
    }
    return null;
  }

  String? _validateConfirm(String? value) {
    if (value != _passwordController.text) {
      return context.l10n.validationPasswordMismatch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AmbientBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Form(
                  key: _formKey,
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const WaweLogo(),
                        const SizedBox(height: 12),
                        Text(
                          l10n.authTagline,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge
                              ?.copyWith(color: AppColors.textMuted),
                        ),
                        const SizedBox(height: 36),
                        AuthModeToggle(mode: _mode, onChanged: _setMode),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.email],
                          autocorrect: false,
                          validator: _validateEmail,
                          decoration: InputDecoration(
                            labelText: l10n.authEmailLabel,
                            prefixIcon: const Icon(Icons.mail_outline_rounded),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          textInputAction: _isSignUp
                              ? TextInputAction.next
                              : TextInputAction.done,
                          autofillHints: [
                            _isSignUp
                                ? AutofillHints.newPassword
                                : AutofillHints.password,
                          ],
                          validator: _validatePassword,
                          onFieldSubmitted: (_) {
                            if (!_isSignUp) _submit();
                          },
                          decoration: InputDecoration(
                            labelText: l10n.authPasswordLabel,
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              tooltip: _obscurePassword
                                  ? l10n.authShowPassword
                                  : l10n.authHidePassword,
                              onPressed: () => setState(
                                () => _obscurePassword = !_obscurePassword,
                              ),
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOutCubic,
                          alignment: Alignment.topCenter,
                          child: _isSignUp
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: TextFormField(
                                    controller: _confirmController,
                                    obscureText: _obscurePassword,
                                    textInputAction: TextInputAction.done,
                                    autofillHints: const [
                                      AutofillHints.newPassword,
                                    ],
                                    validator: _validateConfirm,
                                    onFieldSubmitted: (_) => _submit(),
                                    decoration: InputDecoration(
                                      labelText: l10n.authPasswordConfirmLabel,
                                      prefixIcon: const Icon(
                                        Icons.lock_outline_rounded,
                                      ),
                                    ),
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed:
                                        _loading ? null : _forgotPassword,
                                    child: Text(l10n.authForgotPassword),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 24),
                        GradientButton(
                          label: _isSignUp
                              ? l10n.authSignUpButton
                              : l10n.authSignInButton,
                          loading: _loading,
                          onPressed: _submit,
                        ),
                        const SizedBox(height: 28),
                        _OrDivider(label: l10n.authOrDivider),
                        const SizedBox(height: 28),
                        OutlinedButton.icon(
                          onPressed: _loading
                              ? null
                              : () => _continueWith(AuthProvider.google),
                          icon: Text(
                            'G',
                            style: textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          label: Text(l10n.authContinueWithGoogle),
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton.icon(
                          onPressed: _loading
                              ? null
                              : () => _continueWith(AuthProvider.apple),
                          icon: const Icon(Icons.apple, size: 22),
                          label: Text(l10n.authContinueWithApple),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          l10n.authTermsNotice,
                          textAlign: TextAlign.center,
                          style: textTheme.bodySmall
                              ?.copyWith(color: AppColors.textMuted),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.textMuted),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
