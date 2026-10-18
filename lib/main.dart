import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

void main() {
  runApp(const BookClubApp());
}

class BookClubApp extends StatelessWidget {
  const BookClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Club',
      debugShowCheckedModeBanner: false,
      // shared colors and app bar style
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFEF7FF),
          foregroundColor: Color(0xFF1D1B20),
          centerTitle: true,
          toolbarHeight: 64,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 22,
            height: 28 / 22,
            color: Color(0xFF1D1B20),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
