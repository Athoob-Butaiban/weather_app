import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // to remove the debug tag
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //appBarTheme: Colors.black,
        primaryColor: Colors.blue,
      ),
      routerConfig: router, // to use the router
    );
  }
}

// defingign a router
final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) =>
        HomePage(), // pass the calls name as constructor
  ),
]);
