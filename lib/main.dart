import 'package:flutter/material.dart';
import 'package:taupex/core/auth_check.dart';
import 'package:taupex/core/route_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFire Samples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Palette.kToDark,
          // textTheme: GoogleFonts.timmanaTextTheme(
          //   Theme.of(context).textTheme,
          // ),
          ),
      // home: SignInScreen(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const AuthCheck(),
    );
  }
}
