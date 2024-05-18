import 'package:flutter/material.dart';
import 'package:netflix/presentation/fastlaugh/widget/video_scroll_item.dart';

class Fastlaugh extends StatelessWidget {
   Fastlaugh({super.key});

  List reellink = [
    "https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-waves-in-the-water-1164-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-two-avenues-with-many-cars-traveling-at-night-34562-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-weeds-waving-in-the-breeze-1178-large.mp4"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(reellink.length, (index) {
            return VideoScrollItem(
              index: index, link: reellink[index],
            );
          }),
        ),
      ),
    );
  }
}
