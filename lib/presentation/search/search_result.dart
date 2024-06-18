import 'package:flutter/material.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/search/title.dart';

// ignore: must_be_immutable
class SearchResult extends StatelessWidget {
  List<Movie> data;
  SearchResult({super.key, required this.data});
  String imageBase = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget(title: 'Movies & Shows'),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 1 / 1.4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: List.generate(data.length, (index) {
              return _MainCard(
                imageurl: imageBase + data[index].imagePath,
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _MainCard extends StatelessWidget {
  final String imageurl;
  const _MainCard({required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: NetworkImage(imageurl), fit: BoxFit.cover)),
    );
  }
}
