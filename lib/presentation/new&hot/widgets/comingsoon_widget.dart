import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

// ignore: camel_case_types
class ComingSoon_Widget extends StatelessWidget {
  const ComingSoon_Widget({
    super.key,
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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Vedio_Widget(),
              ),
              Row(
                children: [
                  Text(
                    "DUNE 2",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
              SizedBox(
                height: 10,
              ),
              Text("Coming on Friday"),
              SizedBox(
                height: 10,
              ),
              Text(
                "DUNE 2",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
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


