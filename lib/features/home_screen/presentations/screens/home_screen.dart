import 'package:flutter/material.dart';
import '../widgets/appbar_home_widget.dart';
import '../widgets/slider_home_screen_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {


    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarHomeWidget(),
            SliderHomeScreenList(),
          ],
        ),
      ),
    );
  }
}
