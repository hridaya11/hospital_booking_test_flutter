import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hospital_booking/providers/booking_provider.dart';
import 'package:hospital_booking/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookingProvider(),
      child: MaterialApp(
        title: 'Hospital Booking',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // 60% primary color
          primaryColor: const Color(0xFF4A55A2),
          // 30% secondary color
          scaffoldBackgroundColor: const Color(0xFFF9F9F9),
          // 10% accent color
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFFF24C3D),
            primary: const Color(0xFF4A55A2),
          ),
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF4A55A2),
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A55A2),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
