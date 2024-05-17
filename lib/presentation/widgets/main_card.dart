import 'package:flutter/material.dart';


class MainCard extends StatelessWidget {
  final  String image;
  const MainCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 130,
        height: 20,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image ,
            ),
          ),
        ),
      ),
    );
  }
}
