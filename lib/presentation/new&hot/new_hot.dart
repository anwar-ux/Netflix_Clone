import 'package:flutter/material.dart';
import 'package:netflix/controller/api_controller.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/new&hot/widgets/comingsoon_widget.dart';
import 'package:netflix/presentation/widgets/everyones_watching_widget.dart';

class NewHot extends StatefulWidget {
  const NewHot({super.key});

  @override
  State<NewHot> createState() => _NewHotState();
}

List<Movie> nowPlaying = [];
List<Movie> upcoming = [];

class _NewHotState extends State<NewHot> {
  @override
  void initState() {
    getAllMovies();
    super.initState();
  }

  Future<void> getAllMovies() async {
    nowPlaying = await MovieServices.getNowplaying();
    upcoming = await MovieServices.getupcoming();
    if (!mounted) return; 
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "New & Hot",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            actions: const [
              Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.square,
                size: 35,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              )
            ],
            bottom: const TabBar(
              unselectedLabelColor: Colors.white,
              unselectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              labelColor: Colors.black,
              dividerColor: Colors.black,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              tabs: [
                Tab(
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingsoon(),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }
}

Widget _buildComingsoon() {
  return ListView.builder(
    itemBuilder: (context, index) => ComingSoon_Widget(
      data: upcoming[index],
    ),
    itemCount: upcoming.length,
  );
}

Widget _buildEveryonesWatching() {
  return ListView.builder(
    itemCount: nowPlaying.length,
    itemBuilder: (context, index) => EveryonesWatching_Widget(
      data: nowPlaying[index],
    ),
  );
}
