import 'package:i_cine_app/models/diffusion.dart';
import 'package:i_cine_app/models/movie.dart';

mixin ToAlias{}
class ScreenArgs<T> {
  final T args;

  ScreenArgs(this.args);
}

class MovieScreenArgs = ScreenArgs<Movie> with ToAlias;
class BookingArgs = ScreenArgs<Map<String, dynamic>> with ToAlias;