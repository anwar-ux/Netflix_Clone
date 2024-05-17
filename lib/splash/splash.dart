import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/presentation/main_page/widgets/main_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    splashDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(child: Lottie.network("https://lottie.host/bff1282e-6be4-4cee-a7a2-50d0b02fca85/7GDxJVCWYm.json")),
      ),
    );
  }

  Future<void> splashDelay() async {
    await Future.delayed(const Duration(seconds: 4));
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ScreenMainPage()));
  }
}
