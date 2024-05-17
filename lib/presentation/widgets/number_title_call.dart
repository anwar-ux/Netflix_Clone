import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/main_card_number.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCall extends StatelessWidget {
  const NumberTitleCall({
    super.key,
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
              10,
              (index) => MainCardNumber(
                index: index,
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
