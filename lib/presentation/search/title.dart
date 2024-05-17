import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
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
