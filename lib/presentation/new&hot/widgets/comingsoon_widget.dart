import 'package:flutter/material.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoon_Widget extends StatelessWidget {
  Movie data;
   ComingSoon_Widget({
    super.key,required this.data
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
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
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width:  size.width - 50,
              
                child: Vedio_Widget(
                  image: data.imagePath,
                  
                ),
              ),
             
               Row(
                children: [
                  Flexible(
                    child: Text(
                      data.title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            Text(
                              'Remind me',
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: Colors.white,
                            ),
                            Text(
                              'Info',
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Coming on Friday"),
              const SizedBox(
                height: 10,
              ),
               Flexible(
                 child: Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.fade
                  ),
                             ),
               ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Landing the lead in school musicalis a\ndream come true for jodi, Until the pressure sends her confidence-and her relationship-\ninto a tailspin",
                style: TextStyle(color: Colors.grey, height: 1.5),
              )
            ],
          ),
        ),
      ],
    );
  }
}
