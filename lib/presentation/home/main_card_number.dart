import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainCardNumber extends StatelessWidget {
  const MainCardNumber({super.key, required this.index});
  final int index;

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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/upKD8UbH8vQ798aMWgwMxV8t4yk.jpg",
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
              style:GoogleFonts.robotoMono(
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
