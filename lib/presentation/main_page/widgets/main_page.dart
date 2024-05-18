import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/downl_screen.dart';
import 'package:netflix/presentation/fastlaugh/fastlaugh_screen.dart';
import 'package:netflix/presentation/home/home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new&hot/new_hot.dart';
import 'package:netflix/presentation/search/search_screen.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final  pages = [
    const Home(),
    const NewHot(),
     Fastlaugh(),
    const Search(),
     Downloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexchangeNotifier,
          builder: (context, int index, _) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNav()
    );
  }
}
