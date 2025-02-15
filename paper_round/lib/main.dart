import 'package:flutter/material.dart';

import './screens/jobs_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexColorScheme.light(
        appBarStyle: FlexAppBarStyle.material,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 56, 4, 99),
        ),
        // textTheme: GoogleFonts.nunitoSansTextTheme(),
        textTheme: GoogleFonts.urbanistTextTheme(),
      ).toTheme,
      home: const JobsScreen(),
    );
  }
}
