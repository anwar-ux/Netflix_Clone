import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class VideoScrollItem extends StatefulWidget {
  int index;
  String link;
  VideoScrollItem({super.key, required this.index, required this.link});

  @override
  State<VideoScrollItem> createState() => _VideoScrollItemState();
}

class _VideoScrollItemState extends State<VideoScrollItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the VideoPlayerController with a video URL or file
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.link),
    )..initialize().then((_) {
        setState(() {
          _controller.play();
          
        });
      });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ignore: avoid_unnecessary_containers
        Container(
          child: GestureDetector(
             onTap: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
            child: Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                    aspectRatio: 9/16.5,
                      child: VideoPlayer(_controller),
                    )
                  : const CupertinoActivityIndicator(
                    color: Colors.white,
                    radius: 15,
                  ),
            ),
          ),
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              "https://media.themoviedb.org/t/p/w220_and_h330_face/pFqzXacKsi9or1GVdxTLutXD9zM.jpg"),
                        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(title),
        ],
      ),
    );
  }
}
