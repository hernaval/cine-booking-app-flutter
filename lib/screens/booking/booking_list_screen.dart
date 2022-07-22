import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/data/repositories/booking_repository.dart';
import 'package:i_cine_app/data/repositories/diffusion_repository.dart';
import 'package:i_cine_app/data/services/impl/booking_repository_impl.dart';
import 'package:i_cine_app/data/services/impl/diffusion_repository_impl.dart';
import 'package:i_cine_app/data/services/impl/movie_repository_impl.dart';
import 'package:i_cine_app/data/services/local_service.dart';
import 'package:i_cine_app/models/diffusion.dart';
import 'package:i_cine_app/models/user.dart';
import 'package:i_cine_app/screens/movies/widgets/movie_header.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';
import 'package:i_cine_app/widgets/heading/w_text_large.dart';

import '../../constants/routes.dart';
import '../../data/repositories/movie_repository.dart';
import '../../helpers/screen_args.dart';
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

  //TODO add redirection logic based on booking status
  void continueBooking(Booking booking, Movie movie) {
    Map<String, dynamic> bookingArg =
    {
      'selectedDiffusionId': booking.diffusionId,
      'selectedSeatIds':  [booking.reservedSeats] ,
      'movie': movie,
    }
    ;

    goTo(context, BookingRoute.booking_payment, BookingArgs(bookingArg)
    );
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
                          return  Container(
                            margin: EdgeInsets.only(bottom: 50),
                            child: Column(
                                  children: [
                                    WText(text: "21 Juillet"),
                                    WTextLarge(text: "18:00", color: AppColors.accentColor, size: 14,),
                                    InkWell(
                                      onTap: () =>  continueBooking(ticketSnapshot.data![index], snapshot.data![index]),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF474642),
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                         // margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                          child: MovieHeader(movie: snapshot.data![index], withShadow: false,)
                                      ),
                                    )
                                  ],
                                ),
                          );
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


