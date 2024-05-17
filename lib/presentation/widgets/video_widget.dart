import 'package:flutter/material.dart';

class Vedio_Widget extends StatelessWidget {
  const Vedio_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg",
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