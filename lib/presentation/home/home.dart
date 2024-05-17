import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/controller/api_controller.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/home/backgroundcard.dart';
import 'package:netflix/presentation/widgets/main_card_list.dart';
import 'package:netflix/presentation/widgets/number_title_call.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Movie> nowPlaying = [];
  List<Movie> popular = [];
  List<Movie> topRated = [];
  List<Movie> upcoming = [];
  bool isLoading = true;
  int backgroundIndex = 0;

  Future<void> getAllMovies() async {
    nowPlaying = await MovieServices.getNowplaying();
    popular = await MovieServices.getpopular();
    topRated = await MovieServices.gettoprated();
    upcoming = await MovieServices.getupcoming();
    setState(() {
      isLoading = false;
      backgroundIndex = _getRandomIndex(popular.length);
    });
  }

  int _getRandomIndex(int length) {
    final Random random = Random();
    return random.nextInt(length);
  }

  @override
  void initState() {
    super.initState();
    getAllMovies();
  }

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
                RefreshIndicator(
                  color: Colors.black,
                  backgroundColor: Colors.white,
                  onRefresh: getAllMovies,
                  child: ListView(
                    children: [
                      isLoading
                          ? Container(
                              height: 600,
                              alignment: Alignment.center,
                              child: const CupertinoActivityIndicator(
                                radius: 15,
                                color: Colors.white,
                              ),
                            )
                          : BackGroundCard(data: popular[backgroundIndex]),
                      Main_cardlist(
                        title: 'Released in the Past Year',
                        data: popular,
                      ),
                      Main_cardlist(
                        title: 'Trending Now',
                        data: nowPlaying,
                      ),
                      NumberTitleCall(
                        data: topRated,
                      ),
                      Main_cardlist(
                        title: 'Tense Dramas',
                        data: upcoming,
                      ),
                      Main_cardlist(
                        title: 'South Indian Cinema',
                        data: popular,
                      ),
                    ],
                  ),
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        decoration: BoxDecoration(
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
                                    'TV Shows',
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
                                      Icon(
                                        Icons.arrow_drop_down,
                                        size: 19,
                                        color: Colors.white,
                                      )
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
      ),
    );
  }
}
