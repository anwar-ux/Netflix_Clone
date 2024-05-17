import 'package:flutter/material.dart';
import 'package:netflix/presentation/search/title.dart';
const imageurl =
      "https://media.themoviedb.org/t/p/w220_and_h330_face/CBRqel4Yzm8BS4fTMScYA1fQLD.jpg";


class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget(title: 'Movies & Shows'),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 1/1.4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: List.generate(20, (index) {
              return _MainCard();
            }),
          ),
        ),
      ],
    );
  }
}

class _MainCard extends StatelessWidget {
  const _MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(image: NetworkImage(imageurl),
        fit: BoxFit.cover)
      ),
    );
  }
}
