import 'package:flutter/material.dart';
import 'package:taupex/core/auth_check.dart';
import 'package:taupex/core/route_constants.dart';
import 'package:taupex/ui/view/card_screen/card_screen_view.dart';
import 'package:taupex/ui/view/history_screen/history_screen_view.dart';
import 'package:taupex/ui/view/home_screen/home_screen_view.dart';
import 'package:taupex/ui/view/login_screen/login_screen_view.dart';
import 'package:taupex/ui/view/page_selector/page_selector_view.dart';
import 'package:taupex/ui/view/profile_screen/profile_screen_view.dart';
import 'package:taupex/ui/view/splash_screen/splash_screen_view.dart';
import 'fade_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      //Basic Pages
      case authCheck:
        return FadeRoute(page: const AuthCheck());

      case splashScreen:
        return FadeRoute(page: const SplashScreenView());

      case pageSelector:
        return FadeRoute(page: const PageSelectorView());

      case signInScreen:
        return FadeRoute(page: const LoginScreenView());

      case historyScreen:
        return FadeRoute(page: const HistoryScreenView());

      case homeScreen:
        return FadeRoute(page: const HomeScreenView());

      case cardScreen:
        return FadeRoute(page: const CardScreenView());

      case profileScreen:
        return FadeRoute(page: const ProfileScreenView());

      // case addPropertyScreen:
      //   AddPropertiesScreenView? arguments = args as AddPropertiesScreenView?;
      //   return FadeRoute(
      //       page: AddPropertiesScreenView(
      //     id: arguments!.id,
      //         from: arguments.from,
      //   ));

      // case propertyDetails:
      //   PropertyDetailsScreenView? arguments =
      //       args as PropertyDetailsScreenView?;
      //   return FadeRoute(
      //     page: PropertyDetailsScreenView(
      //       id: arguments!.id,
      //       property: arguments.property,
      //     ),
      //   );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('ERROR ROUTE'),
        ),
      );
    });
  }
}
