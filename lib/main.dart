import 'package:flutter/material.dart';
import 'package:kaku/routes.dart';
import 'package:kaku/screens/profile/profile_screen.dart';
import 'package:kaku/screens/splash/splash_screen.dart';
import 'package:kaku/theme.dart';

Future<void> main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaku',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
