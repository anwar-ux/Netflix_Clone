import 'package:flutter/material.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w600_and_h900_bestv2/fSRb7vyIP8rQpL0I47P3qUsEKX3.jpg"))),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _mylistbutton(),
                      _playbutton(),
                      _infobutton(),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
    _infobutton() {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.info_outline,
            size: 35,
            color: Colors.white,
          ),
        ),
        const Text(
          "Info",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  _mylistbutton() {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
        const Text(
          "My List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  TextButton _playbutton() {
    return TextButton.icon(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white)),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
        size: 30,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}