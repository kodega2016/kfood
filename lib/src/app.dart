import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kfood/src/routes.dart';
import 'package:kfood/src/screens/login.dart';
import 'page_setup.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodCart',
      theme: ThemeData(
        primaryColor: Color(0xff763857),
        fontFamily: GoogleFonts.acme().fontFamily,
      ),
      home: PageSetup(),
      routes: {
        Routes.login: (ctx) => LoginScreen(),
      },
      onGenerateRoute: Routes.onGenerate,
    );
  }
}
