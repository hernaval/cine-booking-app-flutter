import 'package:flutter/material.dart';
import 'package:i_cine_app/data/repositories/movie_repository.dart';
import 'package:i_cine_app/data/services/impl/movie_repository_impl.dart';
import 'package:i_cine_app/data/services/local_service.dart';
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
  late List<Movie> trendMovies = [];
  final IMovieRepository movieRepository = MovieRepositoryImpl(LocalService());

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
      trendMovies = await movieRepository.getTrends();
      setState(() {

      });
  }
  showMovieDetail(Movie movie) {
    showModalBottomSheet(
        // backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) => MovieDetail(movie)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           WTextLarge(text: "En vogue", size: 26,),

          // Trending movies with slider horizontal
          ListViewContainer(
            hasData: trendMovies.isNotEmpty,
            height: 300,
            listView: ListView.builder(
              itemCount: trendMovies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return MovieCard(
                    mode: CardTypeMode.landscape,
                    onTapHandler: showMovieDetail,
                  movie: trendMovies[index],
                );
              },
            ),
          ),

          WTextLarge(text: "Categories", size: 26,),
          // Categories list with slider horizontal
          ListViewContainer(
              hasData: true,
              height: 50,
              listView: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(right: 20),
                      child: WCard(
                        texts: ["????", "Horror"],
                      )
                  );
                },
              )
          ),
          SizedBox(height: 30,),
          WTextLarge(text: "Recommende pour vous", size: 26,),
          // slider horizontal

          // Trending movies with slider horizontal
          ListViewContainer(
            hasData: trendMovies.isNotEmpty,
            height: 300,
            listView: ListView.builder(
              itemCount: trendMovies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return MovieCard(
                    mode: CardTypeMode.portrait,
                    onTapHandler: showMovieDetail,
                  movie: trendMovies[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
