import 'package:flutter/material.dart';

String imageBase = 'https://image.tmdb.org/t/p/w500/';

// ignore: camel_case_types
class Vedio_Widget extends StatelessWidget {
  final String image;
 Vedio_Widget({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageBase+image,
        width: double.infinity,
        fit: BoxFit.cover,
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withOpacity(0.4),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
