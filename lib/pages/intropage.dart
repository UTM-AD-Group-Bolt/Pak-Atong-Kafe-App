import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/models/cartmodel2.dart';
import 'package:myapp/pages/cartpage2.dart';
import 'package:provider/provider.dart';
import 'package:myapp/pages/homepage2.dart';


class preintro extends StatelessWidget {
  const preintro({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => cartmodel2(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroScreen(),
      ),
    );
  }
}
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // big logo
            Padding(
              padding: const EdgeInsets.only(
                left: 100.0,
                right: 100.0,
                top: 120,
                bottom: 20,
              ),
              child: Image.asset('images/iconapppakatongnobg.png'),
            ),

            // we deliver groceries at your doorstep
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'We deliver',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),

            // groceree gives you fresh vegetables and fruits
            Text(
              'Fast delivery',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 24),

            const Spacer(),

            // get started button
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return homepage2();
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 112, 91, 222),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}