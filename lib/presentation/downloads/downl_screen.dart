import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class Downloads extends StatelessWidget {
  Downloads({super.key});

  final _widgetlist = [
    const _SmartDownloads(),
     Section2(),
    const Section3()
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          )),
      body: ListView.separated(
        padding:const EdgeInsets.all(6),
        itemBuilder: (context,index)=>_widgetlist[index], 
        separatorBuilder: (context,index)=>const SizedBox(height: 25,),
         itemCount: _widgetlist.length)
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List<String> imagelist = [
    "https://media.themoviedb.org/t/p/w220_and_h330_face/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/pFqzXacKsi9or1GVdxTLutXD9zM.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/CBRqel4Yzm8BS4fTMScYA1fQLD.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Indroducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "We will downloada a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndivice",
          style: TextStyle(color: Colors.grey, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: size.width,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.38,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              Image_rotate(
                imagelist: imagelist[0],
                angle: 18,
                margin: const EdgeInsets.only(left: 170,bottom: 10 ),
                size: Size(size.width * 0.35, size.width * 0.52),
              ),
              Image_rotate(
                imagelist: imagelist[1],
                angle: -18,
                margin: const EdgeInsets.only(right: 170, bottom: 10),
                size: Size(size.width * 0.35, size.width * 0.52),
              ),
              Image_rotate(
                imagelist: imagelist[2],
                margin: const EdgeInsets.only(top: 30),
                size: Size(size.width * 0.4, size.width * 0.58),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: Colors.blueAccent[700],
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Text('Smart downloads')
      ],
    );
  }
}

class Image_rotate extends StatelessWidget {
  Image_rotate({
    super.key,
    required this.imagelist,
    this.angle = 0,
    required this.margin,
    required this.size,
  });

  final String imagelist;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
                image: NetworkImage(imagelist), fit: BoxFit.cover)),
      ),
    );
  }
}
