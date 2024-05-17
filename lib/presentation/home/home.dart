// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/presentation/home/backgroundcard.dart';
import 'package:netflix/presentation/widgets/main_card_list.dart';
import 'package:netflix/presentation/widgets/number_title_call.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;

            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackGroundCard(),
                  Main_cardlist(title: 'Released in past year'),
                  Main_cardlist(title: 'Trending Now'),
                  NumberTitleCall(),
                  Main_cardlist(title: 'Tense Dramas'),
                  Main_cardlist(title: 'South Indian Cinema')
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                    duration:const Duration(milliseconds: 100000),
                    decoration:  BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0.1),
                          ],
                        ),
                      ),
                      height: 90,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Tv Shows',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Movies',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Categories',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(Icons.arrow_drop_down,size: 19,color: Colors.white,)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: 70,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    ));
  }
}
