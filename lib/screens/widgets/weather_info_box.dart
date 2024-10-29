import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherInfoBox extends StatelessWidget {
  final String title;
  final Widget valueIndicator;
  final String unitString;

  const WeatherInfoBox({
    super.key,
    required this.title,
    required this.valueIndicator,
    required this.unitString,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10.0),
        valueIndicator,
        const SizedBox(height: 10.0),
        Text(
          unitString,
          style: GoogleFonts.lato(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
