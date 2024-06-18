import 'package:flutter/material.dart';
import 'package:netflix/presentation/fastlaugh/widget/video_scroll_item.dart';

// ignore: must_be_immutable
class Fastlaugh extends StatelessWidget {
   Fastlaugh({super.key});

  List reellink = [
    "https://assets.mixkit.co/videos/1186/1186-720.mp4",
    "https://assets.mixkit.co/videos/1191/1191-720.mp4",
    "https://assets.mixkit.co/videos/1197/1197-720.mp4",
    "https://assets.mixkit.co/videos/1185/1185-720.mp4",
    "https://assets.mixkit.co/videos/1188/1188-720.mp4"
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
