import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainCardNumber extends StatelessWidget {
  const MainCardNumber({super.key, required this.index, required this.image});
  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    image,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: -5,
          bottom: 0,
          top: 56,
          child: BorderedText(
            strokeWidth: 5,
            strokeColor: Colors.white,
            child: Text(
              '${index + 1}',
              style: GoogleFonts.robotoMono(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 130,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
