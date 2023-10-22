import 'package:feeds/constants/route_names.dart';
import 'package:feeds/route/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.pinkAccent
    ));
    return MaterialApp(
      title: 'Rise n Shine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: loginScreen,
    );
  }
}

