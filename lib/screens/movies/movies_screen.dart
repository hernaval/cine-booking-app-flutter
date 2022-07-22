import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,

        children: [
          Image.asset("assets/images/avengers.jpg"),
          Image.asset("assets/images/avengers.jpg"),
          Image.asset("assets/images/avengers.jpg"),
          Image.asset("assets/images/avengers.jpg"),
          Image.asset("assets/images/avengers.jpg"),
          Image.asset("assets/images/avengers.jpg"),
          Image.asset("assets/images/avengers.jpg"),
          Image.asset("assets/images/avengers.jpg"),

        ],
      )
    );
  }
}
