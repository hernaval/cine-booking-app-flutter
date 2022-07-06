import 'package:flutter/material.dart';
import 'package:i_cine_app/screens/movies/MovieDetail.dart';
import 'package:i_cine_app/widgets/card/movie_card.dart';
import 'package:i_cine_app/widgets/card/w_card.dart';
import 'package:i_cine_app/widgets/container/list_view_container.dart';
import 'package:i_cine_app/widgets/heading/w_text_large.dart';

import '../../models/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  showMovieDetail(Movie? movie) {
    showModalBottomSheet(
        // backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) => MovieDetail()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           WTextLarge(text: "En vogue"),

          // Trending movies with slider horizontal
          ListViewContainer(
            height: 300,
            listView: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return MovieCard(
                    mode: CardTypeMode.landscape,
                    onTapHandler: showMovieDetail,
                );
              },
            ),
          ),

          WTextLarge(text: "Categories"),
          // Categories list with slider horizontal
          ListViewContainer(
              height: 50,
              listView: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(right: 20),
                      child: WCard(
                        texts: ["0", "Horror"],
                      )
                  );
                },
              )
          ),
          SizedBox(height: 30,),
          WTextLarge(text: "Recommende pour vous"),
          // slider horizontal

          // Trending movies with slider horizontal
          ListViewContainer(
            height: 300,
            listView: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return MovieCard(
                    mode: CardTypeMode.portrait,
                    onTapHandler: showMovieDetail
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
