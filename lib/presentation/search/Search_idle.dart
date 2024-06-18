import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/search/title.dart';

// ignore: must_be_immutable
class Searchidel extends StatelessWidget {
  List<Movie> data;
  Searchidel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget(
          title: 'Top searches',
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => Topsearchitem(
              data: data[index],
            ),
            separatorBuilder: (ctx, index) => const SizedBox(
              height: 20,
            ),
            itemCount: data.length,
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class Topsearchitem extends StatelessWidget {
  final Movie data;
  Topsearchitem({super.key, required this.data});

  String imageBase = 'https://image.tmdb.org/t/p/w500/';
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                  image: NetworkImage(imageBase + data.imagePath),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
            child: Text(
          data.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
        const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.black,
            child: Center(
                child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white,
            )),
          ),
        )
      ],
    );
  }
}
