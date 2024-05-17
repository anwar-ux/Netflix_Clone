import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class Main_cardlist extends StatelessWidget {
  final String title;
  const Main_cardlist({
    super.key,
    required this.title
  });

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
              children: List.generate(10, (index) => const MainCard()),),
        ),
         const  SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
