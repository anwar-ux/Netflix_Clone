import 'package:flutter/material.dart';
import 'package:netflix/presentation/new&hot/widgets/comingsoon_widget.dart';
import 'package:netflix/presentation/widgets/everyones_watching_widget.dart';

class NewHot extends StatelessWidget {
  const NewHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            actions: [
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
                height: 3,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 10,
              )
            ],
            bottom: const TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white,
              unselectedLabelStyle:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              labelColor: Colors.black,
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
    itemBuilder: (context, index) => const ComingSoon_Widget(),
    itemCount: 10,
  );
}

Widget _buildEveryonesWatching() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) => const EveryonesWatching_Widget(),
  );
}

