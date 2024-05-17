import 'package:flutter/material.dart';
import 'package:netflix/presentation/fastlaugh/widget/video_scroll_item.dart';

class Fastlaugh extends StatelessWidget {
  const Fastlaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(10, (index) {
            return VideoScrollItem(index: index,); 
          }),
        ),
      ),
    );
  }
}
