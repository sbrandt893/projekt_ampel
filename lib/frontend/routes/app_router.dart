import 'package:flutter/material.dart';
import 'package:projekt_ampel/frontend/views/screens/home_screen.dart';
import 'package:projekt_ampel/frontend/views/screens/settings_screen.dart';

// Routes for AppRouter
enum Routes {
  home,
  settings,
}

// AppRouter for routing
class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (Routes.values.firstWhere((e) => e.toString() == 'Routes.${settings.name}')) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      default:
        return null;
    }
  }
}
