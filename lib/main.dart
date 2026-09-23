import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/portfolio_screen.dart';

void main() {
  runApp(const RiteshPortfolioApp());
}

class RiteshPortfolioApp extends StatelessWidget {
  const RiteshPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ritesh Sharma | Senior Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0F1D),
        primaryColor: const Color(0xFF00D2FF),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00D2FF),
          secondary: Color(0xFF8B5CF6),
          surface: Color(0xFF0F172A),
        ),
      ),
      home: const PortfolioScreen(),
    );
  }
}
