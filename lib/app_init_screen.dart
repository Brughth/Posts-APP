import 'package:animate_do/animate_do.dart';
import 'package:demo2/application_screen.dart';
import 'package:flutter/material.dart';

class AppInitScreen extends StatefulWidget {
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return ApplicationScree();
          }),
          (route) => false,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ZoomIn(
          duration: const Duration(milliseconds: 3600),
          child: const FlutterLogo(
            size: 200,
            style: FlutterLogoStyle.stacked,
          ),
        ),
      ),
    );
  }
}
