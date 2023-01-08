import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taupex/ui/view/home_screen/home_screen_view.dart';
import 'package:taupex/ui/view/login_screen/login_screen_view.dart';
import 'package:taupex/ui/view/page_selector/page_selector_view.dart';
import 'package:taupex/ui/view/splash_screen/splash_screen_view.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  bool isInitialized = false;

  Future<dynamic> initializeApp() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    FirebaseApp snapshot = await _initialization;
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();
    initializeApp().then((value) {
      if (value) {
        setState(() {
          isInitialized = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isInitialized
        ? StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, authSnapshot) {
              if (authSnapshot.hasError) {
                return const Scaffold(
                  body: Center(
                    child: Text(
                      'Error: Something went wrong',
                    ),
                  ),
                );
              }

              if (authSnapshot.connectionState == ConnectionState.active) {
                Object? user = authSnapshot.data;

                if (user == null) {
                  return const LoginScreenView();
                } else {
                  return const PageSelectorView();
                }
              }
              return const SplashScreenView();
            })
        : const SplashScreenView();
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Something went wrong"),
      ),
    );
  }
}
