import 'package:flutter/material.dart';

class titleWidget extends StatelessWidget {
  String title;
   titleWidget({
    super.key,required this.title
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
