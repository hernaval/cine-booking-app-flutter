import 'package:flutter/material.dart';
import 'package:i_cine_app/data/repositories/booking_repository.dart';
import 'package:i_cine_app/data/repositories/diffusion_repository.dart';
import 'package:i_cine_app/data/services/impl/booking_repository_impl.dart';
import 'package:i_cine_app/data/services/impl/diffusion_repository_impl.dart';
import 'package:i_cine_app/data/services/impl/movie_repository_impl.dart';
import 'package:i_cine_app/data/services/local_service.dart';
import 'package:i_cine_app/models/diffusion.dart';
import 'package:i_cine_app/models/user.dart';
import 'package:i_cine_app/screens/movies/widgets/movie_header.dart';

import '../../data/repositories/movie_repository.dart';
import '../../models/booking.dart';
import '../../models/movie.dart';

class BookingListScreen extends StatefulWidget {
  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  final IBoookingRepository boookingRepository = BookingRepositoryImpl(LocalService());
  final IMovieRepository movieRepository = MovieRepositoryImpl(LocalService());
  final IDiffusionRepository diffusionRepository = DiffusionRepositoryImpl(LocalService());

  late List<Movie> movies;
  late List<Booking> myTickets;



  Future<List<Movie>> getRelativeMovieToEachBookingDiffusion(List<Booking> tickets) async {
    List<Movie> relatedMovies = [];
    for(Booking ticket in tickets) {
      relatedMovies.add(
          await this.movieRepository.getMovieByDiffusion(Diffusion(ticket.diffusionId, "date", "", 0, ""))
      );
    }
      return Future.value(relatedMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
            // tab
          FutureBuilder(
            future: boookingRepository.getMyBooking(User(id: "1", fullname: "", email:  "")),
            builder: (context, AsyncSnapshot<List<Booking>>ticketSnapshot) {
              return ticketSnapshot.hasData ?  FutureBuilder(
                future: getRelativeMovieToEachBookingDiffusion(ticketSnapshot.data!),
                builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
                  return Container(
                    height: double.maxFinite,
                    child: snapshot.hasData ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return MovieHeader(movie: snapshot.data![index]);
                        }
                    ) :
                    Container(),
                  );
                }
              ) :
              CircularProgressIndicator()
              ;
            }
          )

        ],
      ),
    );
  }
}


