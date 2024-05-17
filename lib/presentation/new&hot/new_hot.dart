import 'package:flutter/material.dart';

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
            _buildComingsoon(context),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }
}

Widget _buildComingsoon(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return ListView(
    children: [
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          const SizedBox(
            width: 50,
            height: 450,
            child: Column(
              children: [
                Text(
                  "FEB",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  "11",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5),
                ),
              ],
            ),
          ),
          Container(
            width: size.width - 50,
            height: 450,
            color: Colors.yellow,
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      
                      Image.network(
                        "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg",
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 10,bottom: 10,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.black.withOpacity(0.4),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.volume_off,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildEveryonesWatching() {
  return const Text('watching');
}
