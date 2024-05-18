import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_controller.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/search/Search_idle.dart';
import 'package:netflix/presentation/search/search_result.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
    final controller = TextEditingController();
  List<Movie> popoular = [];

  List<Movie> SearchResults = [];
  bool istapped = true;
  Future getPopular() async {
    if (mounted) {
      popoular = await MovieServices.getpopular();
      setState(() {});
    }
  }

  _onSearchChanges() async {
    if (controller.text.isEmpty) {
      setState(() {
        istapped = true;
        SearchResults.clear();
      });
    } else {
      await _featchdataFromServer(controller.text);
    }
  }

  Future _featchdataFromServer(String query) async {
    List<Movie> result = await searchfunction(query);
    setState(() {
      istapped = false;
      SearchResults = result;
    });
  }

  
  @override
  void initState() {
    if (mounted) {
      getPopular();
      controller.text = '';
      super.initState();
      controller.addListener(_onSearchChanges);
      getPopular();
    }
  }

  @override
  void dispose() {
    controller.removeListener(_onSearchChanges);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
               onChanged: (value) {
                  setState(() {
                    value.isEmpty ? istapped = true : istapped = false;
                    _featchdataFromServer(value);
                  });
                },
              backgroundColor: Colors.grey.withOpacity(0.4),
              style: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _isEmpty(controller.text)
          ],
        ),
      )),
    );
  }

    Widget _isEmpty(String value) {
    return istapped
        ? Expanded(
            child: Searchidel(
            data: popoular.isNotEmpty ? popoular : [],
          ))
        : Expanded(
            child: SearchResult(
            data: SearchResults,
          ));
  }

    Future<List<Movie>> searchfunction(String query) async {
    const apiKey = '3f289ebadafa6f95104807f753f7d195';
    const baseUrl = 'https://api.themoviedb.org/3/search/movie';

    int maxtries = 3;
    int mintries = 0;
    while (maxtries > mintries) {
      try {
        final response =
            await http.get(Uri.parse('$baseUrl?api_key=$apiKey&query=$query'));

        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        // ignore: avoid_print
        print('Error in fetching the data');
      }
      mintries++;
    }
    return [];
  }
}
