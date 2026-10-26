import 'package:flutter/widgets.dart';

import '../features/auth/presentation/auth_screen.dart';

abstract final class AppRoutes {
  static const auth = '/';

  static Map<String, WidgetBuilder> get routes => {
        auth: (_) => const AuthScreen(),
      };
}
