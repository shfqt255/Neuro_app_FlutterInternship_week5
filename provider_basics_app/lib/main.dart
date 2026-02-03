import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics_app/Providers/counter_provider.dart';
import 'package:provider_basics_app/Providers/theme_provider.dart';
import 'package:provider_basics_app/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: .light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.lightBlue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.lightBlue),
        ),
        iconTheme: const IconThemeData(color: Colors.white),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
