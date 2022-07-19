import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/data/repositories/booking_repository.dart';
import 'package:i_cine_app/data/services/impl/booking_repository_impl.dart';
import 'package:i_cine_app/models/booking.dart';
import 'package:i_cine_app/models/diffusion.dart';
import 'package:i_cine_app/screens/movies/widgets/movie_header.dart';
import 'package:i_cine_app/widgets/heading/w_text.dart';
import 'package:i_cine_app/widgets/navigation/custom_app_bar.dart';

import '../../constants/routes.dart';
import '../../data/services/local_service.dart';
import '../../helpers/screen_args.dart';
import '../../widgets/actions/w_button.dart';

class BookingSeatScreen extends StatefulWidget {


  @override
  State<BookingSeatScreen> createState() => _BookingSeatScreenState();
}

class _BookingSeatScreenState extends State<BookingSeatScreen> {
  final IBoookingRepository boookingRepository = BookingRepositoryImpl(LocalService());

  List<int> selectedSeatIds = [];


  @override
  void initState() {
    super.initState();

  }

  // TODO save locally to remind user
  _createLocalBooking(String selectedDiffusionId, List<int> selectedSeatIds, dynamic movie) {
    Map<String, dynamic> bookingArg =
    {
      'selectedDiffusionId': selectedDiffusionId,
      'selectedSeatIds': selectedSeatIds,
      'movie': movie,
    }
    ;

    goTo(context, BookingRoute.booking_payment, BookingArgs(bookingArg)
    );

  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BookingArgs;
    final movie = args.args['movie'];
    final selectedDiffusionId = args.args['selectedDiffusionId'];
    
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              MovieHeader(movie: movie),
              SizedBox(height: 40,),

              // screen
              Container(
                width: double.maxFinite,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50,),

              // seat
              FutureBuilder(
                future: boookingRepository.getBookingByDiffusion(Diffusion(selectedDiffusionId, "date", "quality", 0, "123")), //this is not a good practice but time save for now ,
                builder: (context, AsyncSnapshot<List<Booking>>snapshot) {
                  if(snapshot.hasData) {
                    return Wrap(
                      children: List.generate(50, (index) {
                        var reservedSeats = snapshot.data!.map((e) => e.reservedSeats).toList();
                        if(reservedSeats.where((element) => element == index).isNotEmpty) {
                          return  Seat(color: Colors.grey);
                        }
                        return InkWell(
                          onTap: () {
                            setState(() {
                                selectedSeatIds.add(index);
                            });
                          },
                          child:  Seat(
                            color: selectedSeatIds.where((element) => element == index).isNotEmpty ? AppColors.accentColor : Colors.transparent,
                          ),
                        );
                      })
                      ,
                    );
                  }
                  return CircularProgressIndicator();
                }
              ),

              SizedBox(height: 30,),
              // seat legend
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SeatLegend("Vos choix", AppColors.accentColor),
                  SeatLegend("Reserve", Colors.grey),
                  SeatLegend("Libre", Colors.transparent)
                ],
              ),
              SizedBox(height: 40,),
              Container(
                child: WButton(
                  text: "Confirmer",
                  color: AppColors.accentColor,
                  onPressedHandler: () {

                    _createLocalBooking(selectedDiffusionId, selectedSeatIds, movie);

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget SeatLegend(String legend, Color color) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Seat(
          size: 15,
          color: color,
        ),
        WText(text: legend)
      ],
    );
  }
}

class Seat extends StatelessWidget {
  final Color color;
  final double size;

  Seat({this.color = Colors.transparent, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.only(right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
              width: 1,
              color: Colors.white
          ),
          borderRadius: BorderRadius.circular(5.0)
      ),
    );
  }
}

