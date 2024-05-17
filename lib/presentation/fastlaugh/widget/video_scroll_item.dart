import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VideoScrollItem extends StatelessWidget {
  int index;
  VideoScrollItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
               const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage("https://media.themoviedb.org/t/p/w220_and_h330_face/pFqzXacKsi9or1GVdxTLutXD9zM.jpg"),),
                      ),
                      VideoActions(icon: Icons.emoji_emotions, title: 'LOL'),
                      VideoActions(icon: Icons.add, title: 'My List'),
                      VideoActions(icon: Icons.share, title: 'Share'),
                      VideoActions(icon: Icons.play_arrow, title: 'Play'),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActions({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        children: [
          Icon(icon,color: Colors.white,size: 30,),
          const SizedBox(height: 3,),
          Text(title),
        ],
      ),
    );
  }
}
