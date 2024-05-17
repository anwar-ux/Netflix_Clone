import 'package:flutter/material.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

// ignore: camel_case_types
class EveryonesWatching_Widget extends StatelessWidget {
  final Movie data;
  const EveryonesWatching_Widget({
    super.key, required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
         Text(
          data.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
         Text(
          data.overview,
          style: const TextStyle(color: Colors.grey, height: 1.5),
        ),
        const SizedBox(
          height: 50,
        ),
        Vedio_Widget(image:data.imagePath ),
        const SizedBox(
          height: 20,
        ),
        const Row(
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
