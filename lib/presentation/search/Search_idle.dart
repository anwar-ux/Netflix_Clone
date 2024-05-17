import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/search/title.dart';

// ignore: must_be_immutable
class Searchidel extends StatelessWidget {
  const Searchidel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget(title: 'Top searches',),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
              itemBuilder: (ctx, index) =>  Topsearchitem(),
              separatorBuilder: (ctx, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: 10),
        )
      ],
    );
  }
}



// ignore: must_be_immutable
class Topsearchitem extends StatelessWidget {
  Topsearchitem({super.key});
  String imageurl =
      'https://media.themoviedb.org/t/p/w250_and_h141_face/a0jJMlI1Nw83EXaYmN0QHuccRXm.jpg';

  @override
  Widget build(BuildContext context) {
  final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth*0.35,
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
              image: DecorationImage(image: NetworkImage(imageurl)
              ,fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 4,
        ),
        Expanded(child: Text('Movie name',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.black,
            child: Center(child: Icon(CupertinoIcons.play_fill,color: Colors.white,)),
          ),
        )
      ],
    );
  }
}
