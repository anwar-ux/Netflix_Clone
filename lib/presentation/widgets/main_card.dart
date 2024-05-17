import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 130,
        height: 20,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://image.tmdb.org/t/p/w600_and_h900_bestv2/7BsvSuDQuoqhWmU2fL7W2GOcZHU.jpg",
            ),
          ),
        ),
      ),
    );
  }
}
