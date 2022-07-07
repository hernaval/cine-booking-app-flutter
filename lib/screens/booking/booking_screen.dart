import 'package:flutter/material.dart';
import 'package:i_cine_app/constants/colors.dart';
import 'package:i_cine_app/constants/routes.dart';
import 'package:i_cine_app/data/repositories/diffusion_repository.dart';
import 'package:i_cine_app/data/services/impl/diffusion_repository_impl.dart';
import 'package:i_cine_app/data/services/local_service.dart';
import 'package:i_cine_app/helpers/screen_args.dart';
import 'package:i_cine_app/models/diffusion.dart';
import 'package:i_cine_app/screens/movies/widgets/movie_header.dart';
import 'package:i_cine_app/widgets/card/w_card.dart';
import 'package:i_cine_app/widgets/heading/w_text_large.dart';
import 'package:i_cine_app/widgets/navigation/custom_app_bar.dart';

import '../../models/movie.dart';
import '../../widgets/actions/w_button.dart';
import '../../widgets/heading/w_text.dart';

class BookingScreen extends StatefulWidget {

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final IDiffusionRepository diffusionRepository = DiffusionRepositoryImpl(LocalService());
  final List<Map<int, String>> diffusionTime = [
    {1: "10:00"},
    {2: "12:00"},
    {3: "14:00"},
    {4: "16:00"},
    {5: "18:00"},
  ];
  late List<Diffusion> diffusions;
  List<int>selectedTimeKeys = [];
  List<String> selectedDiffusionIds = [];


  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as MovieScreenArgs;

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // movie header with date and time update
                  MovieHeader(movie: movie.args),
                  SizedBox(height: 40,),

                  // available date selector
                  WTextLarge(text: "Choisissez une date", size: 20, color: AppColors.mainTextColor,),

                  FutureBuilder(
                      future: diffusionRepository.getDiffusionsByMovie(movie.args),
                    builder: (context, AsyncSnapshot<List<Diffusion>> snapshot ) {
                        if(snapshot.hasData) {

                          return Wrap(
                            children: snapshot.data!.map((diffusion) {
                              List<String> dateText = diffusion.date.split("-");
                              return Container(
                                margin: EdgeInsets.only(right: 20, bottom: 10),
                                child: InkWell(
                                  onTap: () {
                                    selectedDiffusionIds.add(diffusion.id);
                                    setState(() {
                                      selectedDiffusionIds.clear();
                                      selectedDiffusionIds.add(diffusion.id);
                                    } );
                                  },
                                  child: WCard(
                                    height:  70,
                                    texts: [dateText[0], dateText[1], dateText[2]],
                                    selected: selectedDiffusionIds.where((element) => element == diffusion.id).isNotEmpty
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }

                        return CircularProgressIndicator();
                    }
                  ),


                  SizedBox(height: 30,),

                  // available time selector
                  WTextLarge(text: "Choisissez une heure", size: 20, color: AppColors.mainTextColor,),
                  Wrap(
                    children: diffusionTime.map((time) {
                      return Container(
                        margin: EdgeInsets.only(right: 20, bottom: 10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedTimeKeys.clear();
                              selectedTimeKeys.add(time.keys.first);
                            });
                          },
                          child: WCard(
                            height:  50,
                            width: 90,
                            wCardType: WCardType.inline,
                            texts: [time.values.first,  "AM"],
                            selected: selectedTimeKeys.where((element) => element == time.keys.first).isNotEmpty,
                          ),
                        ),
                      );
                    }).toList()
                  ),

                  SizedBox(height: 30,),
                  // button next
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: WButton(
                          text: "Suivant",
                          color: AppColors.accentColor,
                          onPressedHandler: () {
                            Map<String, dynamic> bookingArg =
                              {
                                'selectedTimeKey': selectedTimeKeys.first,
                                'selectedDiffusionId': selectedDiffusionIds.first,
                                'movie': movie.args,
                              }
                            ;
                            goTo(context, BookingRoute.booking_seat, BookingArgs(bookingArg)
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
        ),
      ),
    );

  }
}
