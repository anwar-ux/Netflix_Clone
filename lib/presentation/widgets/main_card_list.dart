import 'package:flutter/material.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

String imageBase = 'https://image.tmdb.org/t/p/w500/';

class Main_cardlist extends StatelessWidget {
  final List<Movie> data;
  final String title;
  const Main_cardlist({super.key, required this.title,required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
          maxHeight: 195,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                data.length,
                (index) =>  MainCard(
                     image:imageBase+data[index].imagePath,
                    )),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
