import 'package:flutter/material.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/home/main_card_number.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
String imageBase = 'https://image.tmdb.org/t/p/w500/';

class NumberTitleCall extends StatelessWidget {
  final List<Movie> data;
  const NumberTitleCall({
    super.key, required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 Tv Shows In India Now'),
        LimitedBox(
          maxHeight: 195,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              data.length,
              (index) => MainCardNumber(
                index: index, image:imageBase+data[index].imagePath ,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
