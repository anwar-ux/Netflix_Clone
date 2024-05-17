import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

// ignore: camel_case_types
class EveryonesWatching_Widget extends StatelessWidget {
  const EveryonesWatching_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "DUNE 2",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Landing the lead in school musicalis a\ndream come true for jodi, Until the pressure sends her confidence-and her relationship-\ninto a tailspin",
          style: TextStyle(color: Colors.grey, height: 1.5),
        ),
        SizedBox(
          height: 50,
        ),
        Vedio_Widget(),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Icon(
                  Icons.share,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'Share',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'My List',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Play',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        )
      ],
    );
  }
}
