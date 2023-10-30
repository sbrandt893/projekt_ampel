import 'package:flutter/material.dart';
import 'package:projekt_ampel/frontend/views/screens/home_screen.dart';
import 'package:projekt_ampel/frontend/views/screens/settings_screen.dart';

// Routen für die Navigation
enum Routes {
  home,
  settings,
}

// AppRouter ist für die Navigation zwischen den Screens zuständig
class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (Routes.values.firstWhere((e) => e.toString() == 'Routes.${settings.name}')) // Ermittelt die Route anhand des Namens
    {
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
