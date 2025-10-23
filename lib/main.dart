import 'package:flutter/material.dart';
import 'package:mbele_go/theme/colors.dart';
import 'package:mbele_go/screens/home_screen.dart';

void main() {
  // Guidance Note: Firebase initialization goes here later.
  runApp(const MbeleGoApp());
}

class MbeleGoApp extends StatelessWidget {
  const MbeleGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MbeleGo: Kenya\'s Premier Vehicle Marketplace - Drive Forward.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MbeleColors.primaryOrange,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ).copyWith(
          secondary: MbeleColors.highlightPink,
        ),
        fontFamily: 'Inter',
        scaffoldBackgroundColor: MbeleColors.backgroundLight,
        useMaterial3: true,
      ),
      home: const MbeleGoHomeScreen(),
    );
  }
}